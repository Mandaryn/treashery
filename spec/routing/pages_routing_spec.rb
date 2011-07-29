require "spec_helper"

describe LocalitiesController do
  describe "Routing" do

    it "routes to #faq" do
      get("/faq").should route_to("pages#faq")
    end

    it "routes to #about" do
      get("/about").should route_to("pages#about")
    end

    it "routes to #contact" do
      get("/contact").should route_to("pages#contact")
    end
  end
end