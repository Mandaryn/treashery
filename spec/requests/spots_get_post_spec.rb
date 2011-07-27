require 'spec_helper'

describe "Spots" do
  before(:each) do
      @spot = Spot.create!(:name => "Spot test", :lng => 20.0, :lat => 51.0)
  end
  
  describe "GET /spots" do    
    it "displays spots" do
      visit spots_path
      page.should have_content("Spot test")
    end
  end
  
  describe "POST /spots" do
    it "create spots" do
      visit edit_spot_path(@spot)
      fill_in "Description", :with => "Spot test 2"
      click_button "Update Spot"
      page.should have_content("Spot test 2")
    end
  end 
end