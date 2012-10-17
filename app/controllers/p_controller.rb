class PController < ApplicationController
  def show
    str = params[:id]
    arr = str.split(/_/)
		id = arr[0]
    page_num = 1
    unless arr[1].blank?
      page_num = arr[1]
    end
	  @article = Article.find(id)
    @article.inc(:hits, 1)
    @count = Topic.where(:article_id => id).count
	  @topic = Topic.where(:article_id => id).first

  end

  def renew
  end

  def top
  end
end
