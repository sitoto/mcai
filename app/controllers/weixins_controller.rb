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
    query_type = params[:xml][:MsgType]
    query_content = params[:xml][:Content]

    if query_type == "text"
      if  query_content == "Hello2BusUser"
        render "welcome", :formats => :xml
      else
        @echostr = get_lamp_info(car_info)
        render "echo", :formats => :xml
      end
    elsif query_type == "image"
      render "echotest", :formats => :xml , :status => 200
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_weixin
    #    @weixin = Weixin.find(params[:id])
  end

  def get_lamp_info(car_info)
    #变大写
    #去掉空格，成为数组| 成为一条语句

    lamp = Lamp.any_of({maker: Regexp.new(".*"+car_info+".*")}, {model: Regexp.new(".*"+car_info+".*")} ).first

    if lamp
      "#{t('lamps.high_beam')}:#{lamp.high_beam}"
    else
      "对不起，暂未查询到数据，我正在完善数据库，欢迎过会再来查。"
    end


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
