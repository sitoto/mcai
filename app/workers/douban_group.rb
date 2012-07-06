#encoding: UTF-8

require "nokogiri"
require "open-uri"
require "common"
#采集豆瓣小组的-爬虫
class DoubanGroup
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

	def get_all_topic_urls
		
	end

	def dehydrate_topic(url, assign = "ip")

	end


end
