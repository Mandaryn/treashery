require 'spec_helper'

describe "Spots" do
  describe "DELETE /spots" do
    before do
      @spot = Factory(:spot)
    end

    it "deletes spot" do
      visit spot_path(@spot)
      click_link "Destroy"
      page.should have_no_content("Spot test 2")
    end
  end
end