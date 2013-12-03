#encoding: utf-8
require 'open-uri'
require 'timeout'
require 'logger' 
module Common
  def safe_open(url, retries = 5, sleep_time = 0.42,  headers = {})
    begin  
      html = open(url).read  
		rescue StandardError,Timeout::Error, SystemCallError, Errno::ECONNREFUSED #有些异常不是标准异常  
      puts $!  
      retries -= 1  
      if retries > 0  
        sleep sleep_time and retry  
      else  
        Event.create(name: url, note: $!, status: "error")
        ""
				#logger.error($!)
				#错误日志
        #TODO Logging..  
      end  
    end
  end
  def get_tianya_bbs_page_url(url, p)
    regEx_tianya_1 = /bbs\.tianya\.cn\/\w*\-\w*\-\w*\-/
    filename = ".shtml"

    if regEx_tianya_1  =~ url
      myurl = ("http://" << regEx_tianya_1.match(url).to_s) << "#{p}" << filename
    end
    myurl
  end

end
class String 
		#替换<br> 为 文本的 换行 
    def br_to_new_line  
        self.gsub('<br>', "\n")  
    end  
		#去掉所有的html标签，但是保留 文字
    def strip_tag  
        self.gsub(%r[<[^>]*>], '')  
    end  
		#去掉所有 html标签，不保留文字 
		def strip_all_tag
			self.gsub(%r[<.*>], '')
		end
		#去掉 某些 后 然后再去掉 。。。
		def strip_txt_tag
			self.gsub(%r[<br>], "\n").gsub(%r[<[^>]*>], '')
		end
 		def strip_href_tag
			self.gsub(%r[<a[^>]*>], '').gsub("</a>", "")
		end
    #获取 日期
	  def get_datetime
      regEx = /2\d+-[0-9]+-[0-9]+\D[0-9]+:\d+:\d+/
      if regEx =~ self
        return regEx.match(self).to_s
      else
        return "0000-00-00 0:0:0"
      end
    end
end #String 

