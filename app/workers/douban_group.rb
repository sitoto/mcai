#encoding: UTF-8

require "nokogiri"
require "open-uri"
require "common"
#采集豆瓣小组的-爬虫
class DoubanGroup
include Common
	#打印出入口地址页的分类页面 url
	def	init(first_url = "http://www.douban.com/group/10036/")
		@first_url = first_url
	end

	def pa_rukou_dizhi 
		Spidr.site(@first_url) do |spider|
			spider.every_html_page do |page|
				puts page.title
			end
		end
	end

	def get_all_topics
#	safe_open(url, retries = 5, sleep_time = 0.42, headers = {},from_c = "gbk",to_c = "utf-8")
  html_stream = safe_open(@first_url.to_s , retries = 5, sleep_time = 0.42, headers = {}, from_c = "utf-8", to_c = "utf-8")	
		doc = Nokogiri::HTML(html_stream)
    @bankuai_title = doc.css("title").text
  	puts "come ============" + @bankuai_title
  @bankuai = []
    doc.css("div#content  div.article > table  > tr").each_with_index do |item, i|
      if i > 0
         @bankuai <<  [ item.css("td")[0].text,
                        item.css("td")[1].text,
                        0,
                        item.css("td")[2].text,
                        item.css("td")[3].text,
                        item.at_css("td > a").attr("href")]
      end

    end
		@bankuai
	end

	def dehydrate_topic(url, assign = "ip")

	end


end
