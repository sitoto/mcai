#encoding: UTF-8
require "nokogiri"
require "open-uri"
require "common"
require "pp"
class TianyaBbs 
  include Common


  def dehydrate_topic(url)
    html_stream = safe_open(url , retries = 2, sleep_time = 0.42, headers = {})   
    return if html_stream.empty?
    doc = Nokogiri::HTML(html_stream)
    # article summary
    xpath_category = "//p[@class='crumbs']/em/a/text()"
    xpath_lz = "//div[@id='post_head']/div/div[@class='atl-info']/span[1]/a/text()"
    #xpath_lz = "//meta[@name='author']/@content"
    xpath_created_at = "//div[@id='post_head']/div/div[@class='atl-info']/span[3]/text()"
    xpath_created_at_2 = "//div[@id='post_head']/div/div[@class='atl-info']/span[2]/text()"

    # page info
    xpath_paginator = "//div[@class='atl-pages']/form/@onsubmit"
    xpath_firstcontent = "//div[@class='bbs-content clearfix']"

    title = doc.at_css("h1").text.strip
    #    if doc.at_css("div.topic-doc > table.infobox .tablecc")
    #      title =  doc.at_css("div.topic-doc > table.infobox .tablecc").text.from(3)
    #    end

    category   = doc.at_xpath(xpath_category).to_s
    lz         = doc.at_xpath(xpath_lz).to_s
    created_at = doc.at_xpath(xpath_created_at).to_s.split('：')[1]
    unless created_at.include?('-')
      created_at = doc.at_xpath(xpath_created_at_2).to_s.split('：')[1]
    end

    all_page_num =  1
    if doc.at_xpath(xpath_paginator)
      all_page_num = doc.at_xpath(xpath_paginator).to_s.split(')')[0].split(',')[-1].to_s
    end

    firstcontent = doc.at_xpath(xpath_firstcontent).inner_html.to_s.strip

    post = Post.new
    post.author = lz
    post.created_at = created_at
    post.level = 0
    post.my_level = 0
    post.content = firstcontent.to_s.strip_href_tag
    post.words_count = post.content.length

    @article = Article.find_or_create_by(from_url: url)
    @article.update_attributes!(title: title, mytitle: title, tags: [category, lz], author: lz, from_name: 'tianya_bbs',
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
                         url: url,   page_num: 1 , posts_count: 1, posts: [post]) 

      my_level = @article.posts_count

      doc.xpath("//div[@class='atl-main']/div[@class='atl-item']").each_with_index do |item, i|

        next  if  item.at_xpath("div[@class='atl-head']/div[@class='atl-head-reply']").blank? 
        post = Post.new
        post.author = item.at_xpath("div[@class='atl-head']/div[@class='atl-head-reply']/a[@class='reportme a-link']/@author").to_s
        post.created_at  =  item.at_xpath("div[@class='atl-head']/div[@class='atl-head-reply']/a[@class='reportme a-link']/@replytime").to_s
        post.content=  item.at_xpath("div[@class='atl-content']/div/div[@class='bbs-content']").inner_html.to_s.strip
#item.at_css("div.atl-content div.bbs-content").inner_html.to_s.strip_href_tag
        post.level = i+1
        post.words_count = post.content.length
        if post.author == @topic.author
          my_level += 1
          post.my_level = my_level
          @topic.inc(words_count: post.words_count, post_count: 1)	
          @topic.inc(posts_count: 1)
          @topic.posts <<  post 
        end	
      end #end for each_with_index

      @article.topics.push(@topic)
      @article.inc(words_count: @topic.words_count, posts_count: @topic.posts.count)
      @article.save
      @topic.save
    end

    max_page_num.upto(@article.pages_count) do |i|
      page = TianyaBbsPage.new(get_tianya_bbs_page_url(url, i) , @article.author)
      posts2,  all_words_count = page.get_author_content

      topic2 = Topic.new(title: title, mytitle: title, tags: [category, lz], author: lz, words_count: all_words_count,
                         url: url,   page_num: i , posts_count: posts2.length, posts: posts2)
      topic2.save
      @article.inc(posts_count: posts2.length, words_count: all_words_count)

      @article.topics.push(topic2)
      @article.save
    end

    @article
  end
end
