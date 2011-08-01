require "spec_helper"

describe LocalitiesController do
  describe "routing" do
    it "routes to #show" do
      get("/localities/1").should route_to("localities#show", :id => "1")
    end
  end
end
