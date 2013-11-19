#encoding: UTF-8
require "nokogiri"
require "open-uri"
require "common"
#
class DoubanGroupPage
  include Common

	#打印出入口地址页的分类页面 url
	def	initialize(url, author)
		@page_url = url
    @author = author
    get_page_content
	end

	def get_page_content
	  @html_stream = safe_open(@page_url , retries = 3, sleep_time = 0.42, headers = {})
		#@html_stream.encode!("utf-8","gbk")
  end
  def get_author_content
		doc = Nokogiri::HTML(@html_stream)
    rows = doc.xpath('//ul[@id="comments"]/li')#/div[@class="reply-doc content"]')
#		return rows
		posts = []
    all_words_count = 0
		rows.each_with_index do |row, i|
			author 		= row.at_css('h4 a').text()
			next if !(@author.to_s == author) #.eql?(author)
			post = Post.new()

			post.author = author
			post.created_at = row.at_css('h4 > span.pubtime').text().strip.to(18)
			post.content		= row.at_css("p").inner_html.to_s.strip_href_tag
    	post.level			= i + 1
    	post.words_count = post.content.length
      all_words_count += post.words_count 

			posts << post
		end
		[posts, all_words_count]
	end
end
