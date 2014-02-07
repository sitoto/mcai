class LampSetsController < ApplicationController
  before_action :set_lamp_set, only: [:show, :edit, :update, :destroy]

  # GET /lamp_sets
  def index
    @lamp_sets = LampSet.all
  end

  # GET /lamp_sets/1
  def show
  end

  # GET /lamp_sets/new
  def new
    @lamp_set = LampSet.new
  end

  # GET /lamp_sets/1/edit
  def edit
  end

  # POST /lamp_sets
  def create
    @lamp_set = LampSet.new(lamp_set_params)

    if @lamp_set.save
      redirect_to @lamp_set, notice: 'Lamp set was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /lamp_sets/1
  def update
    if @lamp_set.update(lamp_set_params)
      redirect_to @lamp_set, notice: 'Lamp set was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /lamp_sets/1
  def destroy
    @lamp_set.destroy
    redirect_to lamp_sets_url, notice: 'Lamp set was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lamp_set
    @lamp_set = LampSet.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def lamp_set_params
    params.require(:lamp_set).permit(:name, :style, :note)
  end
end
