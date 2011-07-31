require 'spec_helper'

describe "Localities" do

  describe "DELETE /localities" do
    before do
      @locality = Factory(:locality)
    end

    it "deletes locality" do
      visit locality_path(@locality)
      click_link "Destroy"
      page.should have_no_content("Locality test")
    end
  end
end