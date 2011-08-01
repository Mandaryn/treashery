require 'spec_helper'

describe "Root page" do
  before(:each) do
    @inside1 = Spot.create!(name: "inside1", location: Point.new(lng: 20.0, lat: 51.0))
    @inside2 = Spot.create!(name: "inside2", location: Point.new(lng: 22.0, lat: 51.0))
    @outside = Spot.create!(name: "outside", location: Point.new(lng: 0.0, lat: 0.0))
  end

  it "should show spots in current map bounds", js: true do
    visit root_path
    page.should have_content('inside1')
    page.should have_content('inside2')
    page.should have_content('outside')

    page.execute_script('map.setCenter(new google.maps.LatLng(0.0, 0.0))')

    page.should have_no_content('inside1')
    page.should have_no_content('inside2')
    page.should have_content('outside')
  end
end