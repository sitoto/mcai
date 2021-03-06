class LampsController < Cpanel::ApplicationController
  before_action :set_lamp, only: [:show, :edit, :update, :destroy]

  # GET /lamps
  def index
    page_num = params[:page]
    @lamps = Lamp.all.car.page(page_num).per(50)
  end
  def search
    page_num = params[:page]
    q = params[:q]
    @search_txt= q
    q.upcase!
    @lamps = Lamp.where(:model_alias => q.strip).car.page(page_num).per(50)
    render 'index'


  end

  # GET /lamps/1
  def show
  end

  # GET /lamps/new
  def new
    @lamp = Lamp.new
  end

  # GET /lamps/1/edit
  def edit
  end

  # POST /lamps
  def clone
    @lamp = Lamp.find(params[:id]).clone
    @lamp.model_alias = []
    @lamp.brand = @lamp.brand + "(copy)"

    @lamp.user = current_user

    if @lamp.save # <-- here you save the record
      flash[:notice] = 'Item was successfully cloned.'
    else
      flash[:notice] = 'ERROR: Item can\'t be cloned.'
    end
    redirect_to(lamps_path)
  end


  # POST /lamps
  def create
    @lamp = Lamp.new(lamp_params)
    @lamp.user = current_user

    if @lamp.save
      redirect_to @lamp, notice: 'Lamp was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /lamps/1
  def update
    @lamp.model_alias = []
    if @lamp.update_attributes(lamp_params)
 
      #      debug
      redirect_to @lamp, notice: 'Lamp was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /lamps/1
  def destroy
    @lamp.destroy
    redirect_to lamps_url, notice: 'Lamp was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lamp
    @lamp = Lamp.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def lamp_params
    params.require(:lamp).permit(:emaker, :brand, :ebrand, :maker, :model, :begin_year, :end_year, :lamp_head, :note, :reversing_lamp => [], :high_brake_light => [], :front_signal => [], :front_turn_signal => [], :rear_turn_signal => [], :brake_light => [], :side_turn_signal => [], :high_beam => [], :low_beam => [] ,:fog_light => [], :rear_fog_light => [] , :rear_signal => [])

  end
end
