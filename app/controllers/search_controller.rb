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
    if params[:q].blank?
      return
    else
      search_url = params[:q]
    end
    topic_url = search_url
    from_c = "utf-8"
    to_c = "utf-8"
    regEx_douban_1 = /douban\.com\/group\/topic\/[0-9]*/

#   case
#   when 1
#   end
      

    if regEx_douban_1 =~ topic_url
      @topic_url = ("http://www." << regEx_douban_1.match(topic_url).to_s << "/")
      douban_group_job
    else
      @topic_url = topic_url
      return
    end
  end

  private
  # douban group
  def douban_group_job
    @douban_group = DoubanGroup.new(@topic_url)
    @article = @douban_group.dehydrate_topic(@topic_url)
    if @article
      @article.update_attribute(:from_ip, remote_ip)
      @article.events.create(from_ip: remote_ip, name: @article.title, note: @article.from_url, status: "new")
    else
     @error = Event.last 
    end
  end
 

end
