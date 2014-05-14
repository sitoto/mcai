#encoding: UTF-8
require "nokogiri"
require "open-uri"
require "common"
require "pp"
class BaiduTieba 
  include Common


  def dehydrate_topic(url)
    html_stream = safe_open(url , retries = 2, sleep_time = 0.42, headers = {})   
    html_stream = html_stream.gsub("<!-- ", "")

    return if html_stream.empty?
    doc = Nokogiri::HTML(html_stream)

    if doc.at_css(".p_thread .l_thread_info .l_posts_num .l_pager").blank?
      i = 1 # singal page
      #return false
    else
      i = 0 # mul pages
      #return true
    end

    if doc.at_css(".p_thread .l_thread_info .l_posts_num li span").blank?   #不是贴子页面
      return
    end
    all_post_num = doc.at_css(".p_thread .l_thread_info .l_posts_num li span.red").text
    # article summary
    #xpath_category = "//p[@class='crumbs']/em/a/text()"
    xpath_lz = "//h1/@title"

    # page info
    xpath_firstcontent = "//div[@class='bbs-content clearfix']"

    title = doc.at_css("h1").text.strip

    if doc.at_css("a.card_title_fname")
      category = doc.at_css("a.card_title_fname").text.strip
    elsif doc.at_css("a#tab_home")
      category = doc.at_css("a#tab_home").text.strip
    elsif doc.at_css("li.first > p  > a")
      category = doc.at_css("li.first > p > a").text
    elsif doc.at_css("a.star_title_h3")
      category = doc.at_css("a.star_title_h3").text
    elsif doc.at_css("cb")
      category = doc.at_css("cb").text
    else
      category = "贴吧"
    end

    #category   = doc.at_xpath(xpath_category).to_s
    #lz         = doc.at_xpath(xpath_lz).to_s
    post_json_str= doc.at_css(".l_post").attr("data-field")
    json_post = JSON.parse(post_json_str)

    created_at = json_post["content"]["date"]
    lz = json_post["author"]["user_name"]


    all_page_num = 1
    if (i == 0) #get pagelist
      doc.css(".p_thread .l_thread_info .l_posts_num .l_pager a").each do |link|
        if link.text == "尾页"
          str = link.attr("href")
          column = str.split(/=/)
          all_page_num = column[1]
          break
        end
      end
    end

    @article = Article.find_or_create_by(from_url: url)
    @article.update_attributes!(title: title, mytitle: title, tags: [category, lz], author: lz, from_name: 'baidu_tieba',
                                class_name: category, first_time: created_at, last_url: url, pages_count: all_page_num) 
    #update or add topic(page)
    max_page_num = @article.topics.max(:page_num)
    max_page_num ||= 1
    max_topic =  @article.topics.where(page_num: max_page_num).first
    unless max_topic.blank?
      @article.inc(words_count: -(max_topic.words_count), posts_count: -(max_topic.posts_count))
      max_topic.destroy
    end

    if max_page_num.eql?(1)
      max_page_num += 1
      @article.words_count = 0
      @article.posts_count = 0

      @topic = Topic.new(title: title, mytitle: title, tags: [category, lz], author: lz,
                         url: url,   page_num: 1 , posts_count: 1, posts: []) 

      my_level = @article.posts_count
      
      posts,  all_words_count = BaiduTiebaPage.new("" , @article.author).get_first_page(doc)

      @topic.posts += posts 
      @topic.posts_count =  posts.length 
      @topic.words_count =  all_words_count 

      @article.topics.push(@topic)
      @article.inc(words_count: @topic.words_count, posts_count: @topic.posts.count)
      @article.save
      @topic.save
    end

    max_page_num.upto(@article.pages_count) do |i|

      current_url = get_baidu_tieba_page_url(url, i)
      Delayed::Job.enqueue(BaiduTiebaJob.new(@article.id, current_url, i, category, @article.author, title))

    end

    @article
  end
end
