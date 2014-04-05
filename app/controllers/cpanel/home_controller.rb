class Cpanel::HomeController < Cpanel::ApplicationController
  def index
    @users = User.all
  end
end
