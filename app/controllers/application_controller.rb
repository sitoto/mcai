class ApplicationController < ActionController::Base
  protect_from_forgery

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      '123.3.6.9'
    else
      request.remote_ip
    end
  end

  def update_article(url)
    if  Rule::VALID_DOUBAN_REGEX_1 =~ url
      article_url = ("http://www." << Rule::VALID_DOUBAN_REGEX_1.match(url).to_s << "/")
      Delayed::Job.enqueue(DoubanGroupJob.new(article_url, remote_ip))
    else
      @topic_url = url
      return
    end

  end

end
