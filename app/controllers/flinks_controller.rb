class FlinksController < ApplicationController
  before_action :set_flink, only: [:show, :edit, :update, :destroy]
  before_filter :require_user

  # GET /flinks/1
  def show
  end

  # GET /flinks/new
  def new
    @flink = Flink.new
  end

  # GET /flinks/1/edit
  def edit
  end

  # POST /flinks
  def create
    @flink = Flink.new(flink_params)
    @flink.user = current_user

    if @flink.save
      redirect_to @flink, notice: 'Flink was successfully created.'
    else
      render action: 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flink
      @flink = Flink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flink_params
      params.require(:flink).permit(:name, :url, :image, :description)
    end
end
