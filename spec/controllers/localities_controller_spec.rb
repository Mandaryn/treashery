require 'spec_helper'

describe LocalitiesController do
  describe "GET show" do
    it "assigns the requested locality as @locality" do
      locality = Factory(:locality)
      get :show, :id => locality.id.to_s
      assigns(:locality).should eq(locality)
    end
  end
end
