require "spec_helper"

describe Admin::EventsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/events").should route_to("admin/events#index")
    end

    it "routes to #new" do
      get("/admin/events/new").should route_to("admin/events#new")
    end

    it "routes to #show" do
      get("/admin/events/1").should route_to("admin/events#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/events/1/edit").should route_to("admin/events#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/events").should route_to("admin/events#create")
    end

    it "routes to #update" do
      put("/admin/events/1").should route_to("admin/events#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/events/1").should route_to("admin/events#destroy", :id => "1")
    end

  end
end
