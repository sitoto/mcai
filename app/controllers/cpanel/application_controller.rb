class Cpanel::ApplicationController < ApplicationController
  layout 'cpanel'
  before_filter :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ADMIN_USERNAME && password == ADMIN_PASSWORD
    end
  end
end
