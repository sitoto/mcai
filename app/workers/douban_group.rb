#encoding: UTF-8

require "nokogiri"
require "open-uri"
require "common"
#采集豆瓣小组的-爬虫
class DoubanGroup
	#打印出入口地址页的分类页面 url
	def	init(first_url = "http://www.rubypulse.com/")
		@first_url = first_url
	end

	def putstitle
		Spidr.site(@first_url) do |spider|
			spider.every_html_page do |page|
				puts page.title
			end
		end
	end
end
