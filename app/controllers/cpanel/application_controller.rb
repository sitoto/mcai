class Cpanel::ApplicationController < ApplicationController
  layout 'cpanel'
  before_filter :authenticate

  protected

  def authenticate
    if current_user
      if current_user.provider == "weibo" && current_user.uid == "2183382954"
      elsif current_user.provider == "identity" && (current_user.uid ==  "52b6de7b9a62d2a71f000001" || current_user.uid ==  "52b7d5e296a6377fa1000001" ) 
      else
        redirect_to root_url
      end
    else
      redirect_to root_url
    end

    #    authenticate_or_request_with_http_basic do |username, password|
    #      username == ADMIN_USERNAME && password == ADMIN_PASSWORD
    #    end
  end
end
