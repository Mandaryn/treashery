#encoding: utf-8
require 'spec_helper'

describe "Search engine" do
  before do
    Factory(:spot, name: "Warszawa", location: Point.new(lng: 21.00718504125973, lat: 52.239512508848584), type: 'medical')
  end

  it "should find spot by it's name", js: true do
    visit root_path
    
    page.execute_script('map.setCenter(new google.maps.LatLng(0.0, 0.0))')
    
    page.should have_no_content('Warszawa')
    
    page.fill_in "searchInput", with: "Warszawa"
    
    click_button "Search"

    page.should have_content('Warszawa')
  end
end