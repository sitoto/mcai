class ApplicationController < ActionController::Base
  protect_from_forgery

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      '123.3.6.9'
    else
      request.remote_ip
    end
  end

end
