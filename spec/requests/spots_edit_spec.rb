#encoding: utf-8
require 'spec_helper'

describe "Spots" do
  describe "EDIT /spots" do
    before do
      @spot = Factory(:spot)
    end

    it "edits spot" do
      visit edit_spot_path(@spot)
      fill_in "Name", with: "Wielka góra"
      click_button "Update Spot"
      page.should have_content("Wielka góra")
    end
  end
end