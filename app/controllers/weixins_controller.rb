class WeixinsController < ApplicationController
  before_action :set_weixin, only: [:show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token
  before_filter :check_weixin_legality , only: [:create]


  # GET /weixins
  def all
    page_num = params[:page]
    @weixins = Weixin.all.page(page_num).per(50)
  end

  def show
    render :text => get_lamp_info("奥迪 100")
  end

  def create
    query_type = params[:xml][:MsgType]
    query_content = params[:xml][:Content]
    query_user = params[:xml][:FromUserName]

    if query_type == "text"
      if  query_content == "Hello2BusUser"
        @echostr = "谢谢关注 '车灯型号查询'，告诉我车型，我会及时反馈车灯的型号." 
      else

        @echostr = get_lamp_info(query_content)
      end
      render "echo", :formats => :xml
      Weixin.create!(name: query_user, ask: query_content, answer: @echostr)
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
    car_info.upcase!
    #    lamp = Lamp.where({maker: Regexp.new(".*"+car_info+".*")}, {model: Regexp.new(".*"+car_info+".*")}).first
    lamp = Lamp.where(:model_alias => car_info).first

    if lamp
      str =  "#{lamp.brand}#{lamp.model} #{lamp.begin_year}-#{lamp.end_year}\n"
      str += "#{t('lamps.high_beam')}:#{lamp.high_beam.join(',')}\n"
      str << "#{t('lamps.low_beam')}:#{lamp.low_beam.join(',')},\n"
      str << "#{t('lamps.fog_light')}:#{lamp.fog_light.join(',')}\n"
      str << "#{t('lamps.front_signal')}:#{lamp.front_signal.join(',')}\n"
      str << "#{t('lamps.front_turn_signal')}:#{lamp.front_turn_signal.join(',')}\n"
      str << "#{t('lamps.rear_turn_signal')}:#{lamp.rear_turn_signal.join(',')}\n"
      str << "#{t('lamps.side_turn_signal')}:#{lamp.side_turn_signal.join(',')}\n"
      str << "#{t('lamps.brake_light')}:#{lamp.brake_light.join(',')}\n"
      str << "#{t('lamps.high_brake_light')}:#{lamp.high_brake_light.join(',')}\n"
      str << "#{t('lamps.reversing_lamp')}:#{lamp.reversing_lamp.join(',')}"
      str

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
