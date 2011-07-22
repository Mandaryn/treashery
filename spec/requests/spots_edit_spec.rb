require 'spec_helper'

describe "Spots" do
  describe "EDIT /spots" do
    before do
      @spot = Spot.create!(:name => "Spot test", :lng => 20.0, :lat => 51.0)
    end

    it "edits spot" do
      visit edit_spot_path(@spot)
      fill_in "Name", :with => "Spot test 2"
      click_button "Save"
      page.should have_content("Spot test 2")
    end
  end
end