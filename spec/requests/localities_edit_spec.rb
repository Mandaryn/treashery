require 'spec_helper'

describe "Localities" do
  describe "EDIT /localities" do
    before do
      @locality = Factory(:locality)
    end

    it "edits locality" do
      visit edit_locality_path(@locality)
      fill_in "Name", :with => "locality test 2"
      click_button "Update Locality"
      page.should have_content("locality test 2")
    end
  end
end