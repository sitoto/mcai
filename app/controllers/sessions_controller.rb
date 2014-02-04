class SessionsController < ApplicationController
  def new
  end

  def create
#    raise request.env["omiauth.auth"].to_yaml
    user = User.from_omniauth(env["omniauth.auth"])
    user.last_login_ip = remote_ip
    user.save
    session[:user_id] = user.id
    redirect_to root_path, notice: "已登录"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "已注销！"
  end

  def failure
    flash[:danger] =  "验证失败，用户名或密码错误！"
    redirect_to auth_new_path 
  end
end
