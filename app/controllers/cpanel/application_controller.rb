class Cpanel::ApplicationController < ApplicationController
  layout 'cpanel'
  before_filter :authenticate

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      '123.3.6.9'
    else
      request.remote_ip
    end
  end
  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ADMIN_USERNAME && password == ADMIN_PASSWORD
    end
  end
end
