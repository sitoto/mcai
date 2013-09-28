#encoding: UTF-8
require "nokogiri"
require "open-uri"
require "common"
#采集豆瓣小组的-爬虫
class DoubanGroup
  include Common

	#打印出入口地址页的分类页面 url
	def	initialize(frist_url)
		#@first_url = first_url
    #@html_stream = safe_open(@first_url , retries = 3, sleep_time = 0.42, headers = {})
	end

	def get_page_content
	  @html_stream 
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
    doc =  Nokogiri::HTML(safe_open(url , retries = 2, sleep_time = 0.42, headers = {}))
    # article summary
    xpath_category = "//div[@class='title']/a/text()"
    xpath_lz = "//h3/span[@class='from']/a/text()"
    xpath_created_at = "//h3/span[@class='color-green']/text()"
    # page info
    xpath_paginator = "//div[@class='paginator']/a/text()"

	  title = doc.at_css("title").text.strip
    if doc.at_css("div.topic-doc > table.infobox .tablecc")
      title =  doc.at_css("div.topic-doc > table.infobox .tablecc").text.from(3)
    end

    category   = doc.at_xpath(xpath_category).to_s
    lz         = doc.at_xpath(xpath_lz).to_s
    created_at = doc.at_xpath(xpath_created_at).to_s

    all_page_num =  1
    doc.xpath(xpath_paginator).each do |link|
      all_page_num = link.to_s
    end

    firstcontent = doc.at_xpath('//div[@class="topic-doc"]//div[@class="topic-content"]/p').inner_html
    post = Post.new
    post.author = lz
    post.created_at = created_at
    post.level = 0
    post.my_level = 0
    post.content = firstcontent.to_s.strip_href_tag
    post.words_count = post.content.length

    @article = Article.find_or_create_by(from_url: url)
    @article.update_attributes!(title: title, mytitle: title, tags: [category, lz], author: lz,
             class_name: category, first_time: created_at, last_url: url, pages_count: all_page_num) 
#update or add topic(page)
    max_page_num = @article.topics.max(:page_num)
    max_page_num ||= 1
    @article.topics.where(page_num: max_page_num).delete

    if max_page_num.eql?(1)
      @topic = Topic.new(title: title, mytitle: title, tags: [category, lz], author: lz,
                         url: url,   page_num: 1 , posts: [post]) 

      my_level = @article.posts_count

      doc.css(".reply-doc").each_with_index do |item, i|
        post = Post.new
        post.author = item.at_css("a").text
        post.created_at  = item.at_css("h4 > span.pubtime").text.strip.to(18)
        post.content= item.at_css("p").inner_html.to_s.strip_href_tag
        post.level = i+1
        post.words_count = post.content.length
        if post.author == @topic.author
          my_level += 1
          post.my_level = my_level
          @topic.inc(words_count: post.words_count, post_count: 1)	
          @topic.posts <<  post 
        end	
      end #end for each_with_index

      @article.topics.push(@topic)
      @article.inc(words_count: @topic.words_count, posts_count: @topic.posts.count)
      @article.save
      @topic.save
      max_page_num = 2
    end

    max_page_num.upto(@article.pages_count) do |i|
      page = DoubanGroupPage.new(url + "?start=#{100 * (i-1)}" , @article.author)
      posts2 = page.get_author_content

      topic2 = Topic.new(title: title, mytitle: title, tags: [category, lz], author: lz,
               url: url,   page_num: i , posts: posts2)
      topic2.save
      @article.inc(posts_count: posts2.length)

      @article.topics.push(topic2)
      @article.save
    end

    @article
  end
end
