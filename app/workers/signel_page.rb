#encoding: UTF-8
require "nokogiri"
require "open-uri"
require "common"
#
class SignelPage 
  include Common

  def initialize(task)
    @task = task
    @rule = @task.rule
    @url = @task.web_url
    @url_regular = @rule.url_regular
  end

  def result 
    html_stream = safe_open(@url , retries = 3, sleep_time = 0.42, headers = {})
    #html_stream.encode!("utf-8","gbk")
    @doc = Nokogiri::HTML(html_stream)
    @doc.at_xpath(@url_regular).to_s
  end
end
