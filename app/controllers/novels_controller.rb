class NovelsController < ApplicationController
  before_action :set_novel, only: [:show, :edit, :update, :destroy]

  # GET /novels
  def index
    @novels = Novel.all
  end

  # GET /novels/1
  def show
  end

  # GET /novels/new
  def new
    @novel = Novel.new
  end

  # GET /novels/1/edit
  def edit
  end

  # POST /novels
  def create
    @novel = Novel.new(novel_params)

    if @novel.save
      redirect_to @novel, notice: 'Novel was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /novels/1
  def update
    if @novel.update(novel_params)
      redirect_to @novel, notice: 'Novel was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /novels/1
  def destroy
    @novel.destroy
    redirect_to novels_url, notice: 'Novel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novel
      @novel = Novel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def novel_params
      params.require(:novel).permit(:name, :author, :published)
    end
end
