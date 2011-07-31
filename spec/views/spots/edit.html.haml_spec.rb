require 'spec_helper'

describe "spots/edit.html.haml" do
  before(:each) do
    @spot = assign(:spot, stub_model(Spot,
      :name => "MyString",
      :lng => "10.0",
      :lat => "12.0",
      :description => "MyText",
      :address => "MyText2"
    ))
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