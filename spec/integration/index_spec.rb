require 'spec_helper'

describe "Root page" do
	before(:each) do
		@spotInside1 = Spot.create!(:name => "insideSpot1", :lng => 20.0, :lat => 51.0)
		@spotInside2 = Spot.create!(:name => "insideSpot2", :lng => 22.0, :lat => 51.0)
		@spotOutside = Spot.create!(:name => "outsideSpot", :lng => 0.0, :lat => 0.0)
	end
	
	it "should show spotInside1 and spotInside2 and not show spotOutside", :js => true do
		visit root_path
		page.should have_content('insideSpot1')
		page.should have_content('insideSpot2')
		page.should have_content('outsideSpot')
		
		sleep 5
		
		page.execute_script('map.setCenter(new google.maps.LatLng(0.0, 0.0))')
		
    sleep 5
		
		page.should have_no_content('insideSpot1')
		page.should have_no_content('insideSpot2')
		page.should have_content('outsideSpot')

	
	end
end