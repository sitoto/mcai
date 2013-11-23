class PController < ApplicationController
  def show
    id  = params[:id]
    if params[:page].nil?
      page_num = 1
    else
      page_num = params[:page]
    end

    @article = Article.find(id)
    @article.inc(hits: 1)
    @count = Topic.where(article_id: id).count
    #	  @topic = Topic.where(article_id: id, page_num: page_num).first
    @topics =Topic.where(article_id: id, :posts_count.gt => 0).page(page_num).per(1) 
    @topic = @topics.first
  end

  def renew
    id = params[:id]
    article = Article.find(id)
    update_article(article.from_url)

    flash[:notice] = "正在更新页面内容......"
    redirect_to p_path(article)
    
  end

  def top
    id = params[:id]
    @topic = Topic.find(id)
    @topic.inc(like_count: 1)
    @topic.article.inc(like_count: 1)
    #render text:  @topic.article.like_count
   
    respond_to do |format|
      format.js {render layout: false }
    end
  end
end
