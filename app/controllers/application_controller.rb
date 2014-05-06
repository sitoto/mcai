class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      '123.3.6.9'
    else
      request.remote_ip
    end
  end

  def require_user
    if current_user.blank?
      redirect_to   auth_new_path
    end
  end
  private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
