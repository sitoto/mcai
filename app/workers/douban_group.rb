#encoding: UTF-8

require "nokogiri"
require "open-uri"
require "common"
#采集豆瓣小组的-爬虫
class DoubanGroup
include Common
	#打印出入口地址页的分类页面 url
	def	init(first_url)
		@first_url = first_url
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

  def dehydrate_topic
		
	end
end
