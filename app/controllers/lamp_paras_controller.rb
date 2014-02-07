class LampParasController < ApplicationController
  def create
    id = params[:lamp_set_id]
    @lamp_set = LampSet.find(id) 
    @lamp_para = @lamp_set.lamp_paras.create(lamp_para_params)
    redirect_to @lamp_set, notice: t('created')
  end

  def update
  end

  def edit
  end

  def destroy
    id = params[:lamp_set_id]
    lamp_para_id = params[:id]
    @lamp_set = LampSet.find(id) 
    @lamp_para = @lamp_set.lamp_paras.find(lamp_para_id)
    @lamp_para.delete
    redirect_to @lamp_set, notice: t('created')

  end

  private
  def lamp_para_params
    params.require(:lamp_para).permit(:name, :value, :note)
  end
end
