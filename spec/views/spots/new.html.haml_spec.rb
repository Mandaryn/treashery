require 'spec_helper'

describe "spots/new.html.haml" do
  before(:each) do
    assign(:spot, Factory.build(:spot))
  end

  it "renders new spot form" do
    render

    assert_select "form", :action => spots_path, :method => "post" do
      assert_select "input#spot_name", :name => "spot[name]"
      assert_select "input#spot_lng", :name => "spot[lng]"
      assert_select "input#spot_lat", :name => "spot[lat]"
      assert_select "input#spot_address", :name => "spot[address]"
      assert_select "textarea#spot_description", :name => "spot[description]"
    end
  end
end