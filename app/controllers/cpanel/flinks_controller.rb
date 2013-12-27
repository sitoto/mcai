class Cpanel::FlinksController < Cpanel::ApplicationController

  before_action :set_flink, only: [:show, :edit, :update, :destroy]
  before_filter :require_user

  def show
  end

  def index
    @flinks = Flink.all.desc(:id)
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
      redirect_to [:cpanel, @flink], notice: 'Flink was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @flink = Flink.find(params[:id])

    respond_to do |format|
      if @flink.update_attributes(flink_params)
        format.html { redirect_to [:cpanel, @flink], notice: 'flink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flink.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flink
      @flink = Flink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flink_params
      params.require(:flink).permit(:name, :url, :image, :description, :published,:position )
    end
end
