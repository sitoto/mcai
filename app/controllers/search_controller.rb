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
      @topic_url = ("http://www." << Rule::VALID_DOUBAN_REGEX_1.match(topic_url).to_s << "/")
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
