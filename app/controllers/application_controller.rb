class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      '123.3.6.9'
    else
      request.remote_ip
    end
  end

  def update_article(url)
    Event.create!(name: "new", status: "doing",  note: url, from_ip: remote_ip)
    case
    when  Rule::VALID_DOUBAN_REGEX_1 =~ url
      article_url = ("http://www." << Rule::VALID_DOUBAN_REGEX_1.match(url).to_s << "/")
      Delayed::Job.enqueue(DoubanGroupJob.new(article_url, remote_ip))

    when  Rule::VALID_TIANYA_REGEX_1 =~ url
      article_url = "http://" << Rule::VALID_TIANYA_REGEX_1.match(url).to_s
      Delayed::Job.enqueue(TianyaBbsJob.new(article_url, remote_ip))
      #TianyaBbs.new().dehydrate_topic(article_url)

    else
      @topic_url = url
      @articles = Article.where(title: Regexp.new(".*"+ url +".*")).desc(:_id).page(1).per(50)

    end

  end

  def require_user
    if current_user.blank?
      redirect_to   auth_new_path
    end
  end
  private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
