require "spec_helper"

describe WeixinsController do
  describe "routing" do

    it "routes to #index" do
      get("/weixins").should route_to("weixins#index")
    end

    it "routes to #new" do
      get("/weixins/new").should route_to("weixins#new")
    end

    it "routes to #show" do
      get("/weixins/1").should route_to("weixins#show", :id => "1")
    end

    it "routes to #edit" do
      get("/weixins/1/edit").should route_to("weixins#edit", :id => "1")
    end

    it "routes to #create" do
      post("/weixins").should route_to("weixins#create")
    end

    it "routes to #update" do
      put("/weixins/1").should route_to("weixins#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/weixins/1").should route_to("weixins#destroy", :id => "1")
    end

  end
end
