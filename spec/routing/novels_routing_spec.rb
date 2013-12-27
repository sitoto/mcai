require "spec_helper"

describe NovelsController do
  describe "routing" do

    it "routes to #index" do
      get("/novels").should route_to("novels#index")
    end

    it "routes to #new" do
      get("/novels/new").should route_to("novels#new")
    end

    it "routes to #show" do
      get("/novels/1").should route_to("novels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/novels/1/edit").should route_to("novels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/novels").should route_to("novels#create")
    end

    it "routes to #update" do
      put("/novels/1").should route_to("novels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/novels/1").should route_to("novels#destroy", :id => "1")
    end

  end
end
