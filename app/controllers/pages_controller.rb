class PagesController < ApplicationController
  before_action :set_page_num, only: [:hot, :last, :douban_group]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  def hot 
    if params[:page].nil?
      page_num = 1
    else
      page_num = params[:page]
    end
    @articles = Article.fields_for_list.popular.page(page_num).per(28)

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

    respond_to do |format|
      format.html # home.html.erb
    end
  end

  def home 
    @page = Page.notice.last
    @articles = Article.fields_for_list.recent.limit(20)
    @hot_articles = Article.fields_for_list.popular.limit(20)

    respond_to do |format|
      format.html # home.html.erb
    end
  end

  def douban_group 
    if params[:page].nil?
      page_num = 1
    else
      page_num = params[:page]
    end
    @articles = Article.douban_group.recent.page(page_num).per(50)

    respond_to do |format|
      format.html 
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
    @page = Page.new(params[:page])

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
      if @page.update_attributes(params[:page])
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

  end
end
