require "spec_helper"

describe SpotsController do
  describe "routing" do

    it "routes to #index" do
      get("/spots").should route_to("spots#index")
    end

    it "routes to #new" do
      get("/spots/new").should route_to("spots#new")
    end

    it "routes to #show" do
      get("/spots/1").should route_to("spots#show", :id => "1")
    end

    it "routes to #edit" do
      get("/spots/1/edit").should route_to("spots#edit", :id => "1")
    end

    it "routes to #create" do
      post("/spots").should route_to("spots#create")
    end

    it "routes to #update" do
      put("/spots/1").should route_to("spots#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/spots/1").should route_to("spots#destroy", :id => "1")
    end

  end
end
