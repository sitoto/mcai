class HtmlsController < ApplicationController
	layout "cpanel"
  # GET /htmls
  # GET /htmls.json
  def index
    @htmls = Html.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @htmls }
    end
  end

  # GET /htmls/1
  # GET /htmls/1.json
  def show
    @html = Html.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @html }
    end
  end

  # GET /htmls/new
  # GET /htmls/new.json
  def new
    @html = Html.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @html }
    end
  end

  # GET /htmls/1/edit
  def edit
    @html = Html.find(params[:id])
  end

  # POST /htmls
  # POST /htmls.json
  def create
    @html = Html.new(params[:html])

    respond_to do |format|
      if @html.save
        format.html { redirect_to @html, notice: 'Html was successfully created.' }
        format.json { render json: @html, status: :created, location: @html }
      else
        format.html { render action: "new" }
        format.json { render json: @html.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /htmls/1
  # PUT /htmls/1.json
  def update
    @html = Html.find(params[:id])

    respond_to do |format|
      if @html.update_attributes(params[:html])
        format.html { redirect_to @html, notice: 'Html was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @html.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /htmls/1
  # DELETE /htmls/1.json
  def destroy
    @html = Html.find(params[:id])
    @html.destroy

    respond_to do |format|
      format.html { redirect_to htmls_url }
      format.json { head :no_content }
    end
  end
end
