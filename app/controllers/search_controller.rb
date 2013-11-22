class SearchController < ApplicationController
  def index
    per_page = 50 
    page_num = params[:page]
    @search_txt = params[:q]
    @articles = Article.where(title: Regexp.new(".*"+@search_txt+".*")).page(page_num).per(per_page)

    Event.create!(from_ip: remote_ip, name: @search_txt, status: 'search')
  end

  #
  def launch
    return if params[:q].blank?
    topic_url  = params[:q]
    from_c = "utf-8"
    to_c = "utf-8"
    #   case
    #   when 1
    #   end

    if  Rule::VALID_DOUBAN_REGEX_1 =~ topic_url
      article_url = ("http://www." << Rule::VALID_DOUBAN_REGEX_1.match(topic_url).to_s << "/")
      Delayed::Job.enqueue(DoubanGroupJob.new(article_url, remote_ip))
    else
      @topic_url = topic_url
      return
    end
    flash[:notice] = "正在读取和过滤页面内容......"
  end


end
