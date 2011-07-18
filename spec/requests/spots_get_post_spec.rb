require 'spec_helper'

describe "Spots" do	
  describe "GET /spots" do
  	before do
  		Spot.create!(:name => "Spot test")
  	end
  	
    it "displays spots" do
      visit spots_path
      page.should have_content("Spot test")
    end
  end
  
  describe "POST /spots" do
    it "create spots" do
    	visit new_spot_path
    	fill_in "Description", :with => "Spot test 2"
    	click_button "Save"
      page.should have_content("Spot test 2")
    end
  end 
end