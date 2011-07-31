#encoding: utf-8
require 'spec_helper'

describe "Spots" do
  before(:each) do
      @spot = Factory(:spot, name: "Śmieci")
  end

  describe "GET /spots" do
    it "displays spots" do
      visit spots_path
      page.should have_content("Śmieci")
    end
  end
end