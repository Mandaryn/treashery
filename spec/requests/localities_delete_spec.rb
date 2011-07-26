require 'spec_helper'

describe "Localities" do
  
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
  
  describe "DELETE /localities" do
    before do
      @locality = Locality.create! valid_attributes
    end

    it "deletes locality" do
      visit locality_path(@locality)
      click_link "Destroy"
      page.should have_no_content("Locality test")
    end
  end  
end