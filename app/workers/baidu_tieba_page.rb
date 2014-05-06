#encoding: UTF-8
require "nokogiri"
require "open-uri"
require "common"
#
class BaiduTiebaPage
  include Common

  #打印出入口地址页的分类页面 url
  def	initialize(url, author)
    @page_url = url
    @author = author
  end

  def get_page_content
    #@html_stream = safe_open(@page_url , retries = 3, sleep_time = 0.42, headers = {})
    #@html_stream.encode!("utf-8","gbk")
  end
  def get_first_page(doc)
    i = 0
    all_words_count = 0
    posts = []
    #puts doc.css(".p_postlist .l_post").length
    doc.css(".p_postlist .l_post").each do |item|
      post_json_str = item.attr("data-field")
      json_post = JSON.parse(post_json_str)
      created_at = json_post["content"]["date"]
      author = json_post["author"]["name"]
      level = json_post["content"]["floor"]
      content =  item.at_css(".d_post_content").inner_html.to_s.strip

      if (author ==  @author)
        i += 1
        post = Post.new()
        post.author = author
        post.created_at  =  created_at
        post.content  =  content
        post.level			= level 
        post.my_level			= i

        post.words_count = post.content.length
        all_words_count += post.words_count 
        posts << post
      end
    end # end -do each
    return   [posts, all_words_count]
  rescue
    puts $!
    return [posts , all_words_count]
  end

  def get_author_content(url)
    html_stream = safe_open(url , retries = 3, sleep_time = 0.42, headers = {})
    doc = Nokogiri::HTML(html_stream)

    get_first_page(doc)
  end
end
