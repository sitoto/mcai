class WeixinsController < ApplicationController
  before_action :set_weixin, only: [:show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token
  before_filter :check_weixin_legality

  
  # GET /weixins
#  def index
#    @weixins = Weixin.all
#  end

  def show
    render :text => params[:echostr]
  end

#  POST /weixin
#  def create
#   @weixin = Weixin.new(weixin_params)

#   if @weixin.save
#    redirect_to @weixin, notice: 'Weixin was successfully created.'
#   else
#     render action: 'new'
#    end
#  end
  def create
    if params[:xml][:MsgType] == "text"
      render "echo", :formats => :xml
    end
  end



  # PATCH/PUT /weixins/1
  def update
    if @weixin.update(weixin_params)
      redirect_to @weixin, notice: 'Weixin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_weixin
#    @weixin = Weixin.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def weixin_params
#    params.require(:weixin).permit(:name, :ask, :answer, :words_count)
  end

  # 根据参数校验请求是否合法，如果非法返回错误页面
  def check_weixin_legality
    array = [Rails.configuration.weixin_token, params[:timestamp], params[:nonce]].sort

    render :text => "Forbidden", :status => 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
  end


end
