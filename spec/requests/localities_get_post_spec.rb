#encoding: utf-8
require 'spec_helper'

describe "Locality" do
  describe "GET /localities" do
    before do
      Factory(:locality, name: 'Łódź')
    end

    it "displays localities" do
      visit localities_path
      page.should have_content("Łódź")
    end
  end

  describe "POST /localities" do
    it "create localities" do
      visit new_locality_path
      fill_in "Name", :with => "Łódź"
      page.check('sublocality')
      fill_in "Nelat", :with => 30.0
      fill_in "Nelng", :with => 30.0
      fill_in "Swlat", :with => 20.0
      fill_in "Swlng", :with => 20.0
      click_button 'Create Locality'
      page.should have_content('30.0')
      page.should have_content('sublocality')
    end
  end
end
