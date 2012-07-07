require "spec_helper"

describe HtmlsController do
  describe "routing" do

    it "routes to #index" do
      get("/htmls").should route_to("htmls#index")
    end

    it "routes to #new" do
      get("/htmls/new").should route_to("htmls#new")
    end

    it "routes to #show" do
      get("/htmls/1").should route_to("htmls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/htmls/1/edit").should route_to("htmls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/htmls").should route_to("htmls#create")
    end

    it "routes to #update" do
      put("/htmls/1").should route_to("htmls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/htmls/1").should route_to("htmls#destroy", :id => "1")
    end

  end
end
