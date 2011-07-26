require 'spec_helper'

describe "Locality" do
  
  def valid_attributes
  {
    :name => "Locality test",
    :type => ['route', 'political'], 
    :neLat => 22.0,
    :neLng => 23.0,
    :swLat => 24.0,
    :swLng => 25.0    
  }
  end
  
  describe "GET /localities" do
    before do
      Locality.create! valid_attributes
    end
    
    it "displays localities" do
      visit localities_path
      page.should have_content("Locality test")
    end
  end
  
  describe "POST /localities" do
    it "create localities" do
      visit new_locality_path
      fill_in "Name", :with => "Locality test"
      page.check('route')
      page.check('political')
      fill_in "Nelat", :with => 30.0
      fill_in "Nelng", :with => 23.0
      fill_in "Swlat", :with => 24.0
      fill_in "Swlng", :with => 25.0
      click_button "Save"
      page.should have_content("30.0")
      page.should have_content("route")
    end
  end 
end