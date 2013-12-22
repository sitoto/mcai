require "spec_helper"

describe FlinksController do
  describe "routing" do

    it "routes to #index" do
      get("/flinks").should route_to("flinks#index")
    end

    it "routes to #new" do
      get("/flinks/new").should route_to("flinks#new")
    end

    it "routes to #show" do
      get("/flinks/1").should route_to("flinks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/flinks/1/edit").should route_to("flinks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/flinks").should route_to("flinks#create")
    end

    it "routes to #update" do
      put("/flinks/1").should route_to("flinks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/flinks/1").should route_to("flinks#destroy", :id => "1")
    end

  end
end
