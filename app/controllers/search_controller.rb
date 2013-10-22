class SearchController < ApplicationController
  def index
    per_page = 50 
    page_num = params[:page]
    @search_txt = params[:q]
    @articles = Article.where(title: Regexp.new(".*"+@search_txt+".*")).page(page_num).per(per_page)

    Event.create!(from_ip: remote_ip, name: @search_txt, status: 'search')
  end
end
