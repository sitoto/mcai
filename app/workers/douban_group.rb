#encoding: UTF-8
require "nokogiri"
require "open-uri"
require "common"
#采集豆瓣小组的-爬虫
class DoubanGroup
  include Common

	#打印出入口地址页的分类页面 url
	def	initialize(first_url)
		@first_url = first_url
    #get_page_content
	end

	def get_page_content
	  @html_stream = safe_open(@first_url , retries = 3, sleep_time = 0.42, headers = {})
		#@html_stream.encode!("utf-8","gbk")
  end

	def get_all_topics
		doc = Nokogiri::HTML(@html_stream)
    @title = doc.css("title").text
  	@lists = []
    doc.css("div#content  div.article > table  > tr").each_with_index do |item, i|
      if i > 0
         @lists <<  [ item.css("td")[0].text,
                        item.css("td")[1].text,
                        item.css("td")[2].text,
                        item.css("td")[3].text,
                        item.at_css("td > a").attr("href")]
      end
    end
		@lists
	end
	def do_or_not
		@do_lists = []
	  @lists.each do |t|
			if t[2].length > 2 
				@do_lists << [t[4], t[2], t[0], t[1], t[3], "auto" ]
			end
		end
		@do_lists
	end

	def save_topics_html
		@do_lists.each do |d|
			if Html.where(url: d[0]).count == 0
				html_content = safe_open(d[0])
				Html.create(url: d[0], body: html_content, status: "a", top: 0)
			end
			break
		end

	end

  def dehydrate_topic(url)
    doc =  Nokogiri::HTML(safe_open(url , retries = 3, sleep_time = 0.42, headers = {}))

	  title = doc.at_css("title").text
    if doc.at_css("div.topic-doc > table.infobox .tablecc")
      title =  doc.at_css("div.topic-doc > table.infobox .tablecc").text.from(3)
    end

    category = doc.at_css("div.aside > p > a").text.from(1)
    lz = doc.at_css("div.topic-doc > h3 > span.pl20 > a").text
    created_at = doc.at_css("div.topic-doc > h3 > span.color-green").text
    #from_url = url    #存入首页地址
    all_page_num =  1
    if doc.css("div.paginator > a")
      #获取总页数
      doc.css("div.paginator > a").each do |link|
        all_page_num = link.text
      end
    end
    firstcontent = doc.at_xpath('//div[@class="topic-doc"]//div[@class="topic-content"]/p').inner_html
    post = Post.new
    post.author = lz
    post.created_at = created_at
    post.level = 1
    post.my_level = 1
    post.content = firstcontent.to_s.strip_href_tag
    post.words_count = post.content.length

		@article = Article.new(title: title, mytitle: title, tags: [category, lz], author: lz,
             first_time: created_at, from_url: url, last_url: url, pages_count: all_page_num) 

    @topic = Topic.new(title: title, mytitle: title, tags: [category, lz], author: lz,
             url: url,   page_num: 1 , posts: [post]) 


#		dehydrate_posts(@topic, doc)
#	end
#  def dehydrate_posts(@topic, doc)

		my_level = @topic.posts_count
 
		doc.css(".reply-doc").each_with_index do |item, i|
			post = Post.new
      post.author = item.at_css("a").text
      post.created_at  = item.at_css("h4").text.strip.to(18)
			post.content= item.at_css("p").inner_html.to_s.strip_href_tag
			post.level = i+1
			post.words_count = post.content.length
	    if post.author == @topic.author
					my_level += 1
					post.my_level = my_level
					@topic.inc(:words_count, post.words_count)
				  @topic.inc(:post_count, 1)	
					@topic.posts <<  post 
		  end	
    end #end for each_with_index

    @article.topics.push(@topic)
    @article.save
    @topic.save

		page = DoubanGroupPage.new(url + "?start=100" , @article.author)
		posts2 = page.get_author_content
		puts posts2.length

		@topic2 = Topic.new(title: title, mytitle: title, tags: [category, lz], author: lz,
             url: url,   page_num: 2, posts: posts2)
		@topic2.save
		@article.topics.push(@topic2)
		
  end

end
