require 'spec_helper'

describe "spots/edit.html.haml" do
  before(:each) do
    @spot = assign(:spot, Factory.stub(:spot))
  end

  it "renders the edit spot form" do
    render

    assert_select "form", :action => spots_path(@spot), :method => "post" do
      assert_select "input#spot_name", :name => "spot[name]"
      assert_select "input#spot_lng", :name => "spot[lng]"
      assert_select "input#spot_lat", :name => "spot[lat]"
      assert_select "input#spot_address", :name => "spot[address]"
      assert_select "textarea#spot_description", :name => "spot[description]"
    end
  end
end