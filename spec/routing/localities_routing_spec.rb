require "spec_helper"

describe LocalitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/localities").should route_to("localities#index")
    end

    it "routes to #new" do
      get("/localities/new").should route_to("localities#new")
    end

    it "routes to #show" do
      get("/localities/1").should route_to("localities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/localities/1/edit").should route_to("localities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/localities").should route_to("localities#create")
    end

    it "routes to #update" do
      put("/localities/1").should route_to("localities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/localities/1").should route_to("localities#destroy", :id => "1")
    end

  end
end
