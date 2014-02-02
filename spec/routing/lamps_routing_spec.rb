require "spec_helper"

describe LampsController do
  describe "routing" do

    it "routes to #index" do
      get("/lamps").should route_to("lamps#index")
    end

    it "routes to #new" do
      get("/lamps/new").should route_to("lamps#new")
    end

    it "routes to #show" do
      get("/lamps/1").should route_to("lamps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lamps/1/edit").should route_to("lamps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lamps").should route_to("lamps#create")
    end

    it "routes to #update" do
      put("/lamps/1").should route_to("lamps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lamps/1").should route_to("lamps#destroy", :id => "1")
    end

  end
end
