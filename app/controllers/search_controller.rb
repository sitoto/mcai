class SearchController < ApplicationController
  def index
    per_page = 50 
    page_num = params[:page]
    search_txt = params[:q]
    @articles = Article.where(title: Regexp.new(".*"+search_txt+".*")).page(page_num).per(per_page)

    @page_title = "查找：#{search_txt}"
    Event.create!(from_ip: remote_ip, name: @search_txt, status: 'search')
  end

  #
  def launch
    return if params[:q].blank?
    @url  = params[:q]
    from_c = "utf-8"
    to_c = "utf-8"


    update_article(@url)
    @page_title = @url
    flash[:notice] = "正在读取和过滤页面内容......"
  end

  private
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

    when  Rule::VALID_TIEBA_REGEX_1 =~ url
      article_url = "http://tieba." << Rule::VALID_TIEBA_REGEX_1.match(url).to_s
      BaiduTieba.new().dehydrate_topic(article_url)

    when  Rule::VALID_TIEBA_REGEX_2 =~ url
      article_url = "http://tieba.baidu.com/p/" << Rule::VALID_TIEBA_REGEX_2_1.match(url).to_s
      BaiduTieba.new().dehydrate_topic(article_url)

 
    else
      @topic_url = url
      @articles = Article.where(title: Regexp.new(".*"+ url +".*")).desc(:_id).page(1).per(50)

    end

  end


end
