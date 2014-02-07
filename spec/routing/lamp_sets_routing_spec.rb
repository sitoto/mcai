require "spec_helper"

describe LampSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/lamp_sets").should route_to("lamp_sets#index")
    end

    it "routes to #new" do
      get("/lamp_sets/new").should route_to("lamp_sets#new")
    end

    it "routes to #show" do
      get("/lamp_sets/1").should route_to("lamp_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lamp_sets/1/edit").should route_to("lamp_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lamp_sets").should route_to("lamp_sets#create")
    end

    it "routes to #update" do
      put("/lamp_sets/1").should route_to("lamp_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lamp_sets/1").should route_to("lamp_sets#destroy", :id => "1")
    end

  end
end
