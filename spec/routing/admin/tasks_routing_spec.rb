require "spec_helper"

describe Admin::TasksController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/tasks").should route_to("admin/tasks#index")
    end

    it "routes to #new" do
      get("/admin/tasks/new").should route_to("admin/tasks#new")
    end

    it "routes to #show" do
      get("/admin/tasks/1").should route_to("admin/tasks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/tasks/1/edit").should route_to("admin/tasks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/tasks").should route_to("admin/tasks#create")
    end

    it "routes to #update" do
      put("/admin/tasks/1").should route_to("admin/tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/tasks/1").should route_to("admin/tasks#destroy", :id => "1")
    end

  end
end
