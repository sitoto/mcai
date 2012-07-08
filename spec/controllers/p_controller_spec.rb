require 'spec_helper'

describe PController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'renew'" do
    it "returns http success" do
      get 'renew'
      response.should be_success
    end
  end

  describe "GET 'top'" do
    it "returns http success" do
      get 'top'
      response.should be_success
    end
  end

end
