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
    url  = params[:q]
    from_c = "utf-8"
    to_c = "utf-8"
    #   case
    #   when 1
    #   end

    update_article(url)
    flash[:notice] = "正在读取和过滤页面内容......"
  end

end
