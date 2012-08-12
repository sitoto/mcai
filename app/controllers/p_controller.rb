class PController < ApplicationController
  def show
    @topic = Topic.last
  end

  def renew
  end

  def top
  end
end
