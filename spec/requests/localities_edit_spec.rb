require 'spec_helper'

describe "Localities" do
  
  def valid_attributes
  {
    :name => "Locality test",
    :types => ['route', 'political'], 
    :neLat => 22.0,
    :neLng => 23.0,
    :swLat => 24.0,
    :swLng => 25.0    
  }
  end
  
  describe "EDIT /localities" do
    before do
      @locality = Locality.create! valid_attributes
    end

    it "edits locality" do
      visit edit_locality_path(@locality)
      fill_in "Name", :with => "locality test 2"
      click_button "Update Locality"
      page.should have_content("locality test 2")
    end
  end
end