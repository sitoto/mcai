class PagesController < ApplicationController
  before_action :set_page_num , only: [:hot, :last, :douban_group]
  before_action :authenticate, only: [:new, :update, :destroy, :edit]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  def hot 
    page_num = set_page_num
    @articles = Article.fields_for_list.popular.page(page_num).per(28)
    @page_title = "最热文章"

    respond_to do |format|
      format.html # home.html.erb
    end
  end
  def last 
    if params[:page].nil?
      page_num = 1
    else
      page_num = params[:page]
    end
    @articles = Article.fields_for_list.recent.page(page_num).per(28)
    @page_title = "最新文章"

    render :hot
  end
  def author
    author = params[:name]
    @articles = Article.where(author: author).fields_for_list.recent.page params[:page]
    @page_title = "#{author} 的文章"

    render :hot
  end
  def category
    category = params[:name]
    @articles = Article.where(class_name: category).fields_for_list.recent.page params[:page]
    @page_title = "#{category} 的文章"

    render :hot

  end
  def douban_group 
    if params[:page].nil?
      page_num = 1
    else
      page_num = params[:page]
    end
    @articles = Article.douban_group.recent.page(page_num).per(50)
    @page_title = "豆瓣小组"

    render :hot
  end
  def tianya_bbs 
    if params[:page].nil?
      page_num = 1
    else
      page_num = params[:page]
    end
    @articles = Article.tianya_bbs.recent.page(page_num).per(50)
    @page_title = "天涯易读"

    render :hot
  end



  def home 
    @page = Page.notice.last
    @articles = Article.fields_for_list.recent.limit(20)
    @hot_articles = Article.fields_for_list.popular.limit(20)
    @flinks = Flink.published.asc(:position)

    respond_to do |format|
      format.html # home.html.erb
    end
  end

  def about
    @page = Page.about.last
    respond_to do |format|
      format.html # about.html.erb
    end

  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  private
  def set_page_num
    page_num = 1
    if params[:page].nil?
      page_num = 1
    else
      page_num = params[:page]
    end
    page_num
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.require(:page).permit(:title, :permalink, :keywords, :description, :body)
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ADMIN_USERNAME && password == ADMIN_PASSWORD
    end
  end

end
