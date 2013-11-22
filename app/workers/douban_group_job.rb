class DoubanGroupJob < Struct.new(:article_url, :remote_ip)
  def perform
    @douban_group = DoubanGroup.new(article_url)
    @article = @douban_group.dehydrate_topic(article_url)
    if @article
      @article.update_attribute(:from_ip, remote_ip)
      @article.events.create(from_ip: remote_ip, name: @article.title, note: @article.from_url, status: "new")
    else
     @error = Event.last 
    end
 
  end

end
