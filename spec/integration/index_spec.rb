require 'spec_helper'

describe "Root page" do
  before do
    @inside1 = Factory(:spot, name: 'inside1', location: Point.new(lng: 20.0, lat: 51.0))
    @inside2 = Factory(:spot, name: 'inside2', location: Point.new(lng: 20.0, lat: 51.555), type: 'food')
    @outside = Factory(:spot, name: 'outside', location: Point.new(lng: 0.0, lat: 0.0), type: 'radioactive')
  end

  it "should show spots of current type and in current map bounds", js: true do
    visit root_path
    page.should have_content('inside1')
    page.should have_content('inside2')
    page.should have_content('outside')

    page.execute_script('map.setCenter(new google.maps.LatLng(0.0, 0.0))')

    page.should have_no_content('inside1')
    page.should have_no_content('inside2')
    page.should have_content('outside')
    
    page.click_link('medical')

    page.should have_no_content('inside1')
    page.should have_no_content('inside2')
    page.should have_no_content('outside')

    page.click_link('radioactive')

    page.should have_no_content('inside1')
    page.should have_no_content('inside2')
    page.should have_content('outside')

    page.execute_script('map.setCenter(new google.maps.LatLng(51.0, 20.0))')

    page.click_link('all')

    page.should have_content('inside1')
    page.should have_content('inside2')
  end
end