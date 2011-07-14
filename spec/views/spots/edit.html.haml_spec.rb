require 'spec_helper'

describe "spots/edit.html.haml" do
  before(:each) do
    @spot = assign(:spot, stub_model(Spot,
      :name => "MyString",
      :lng => "",
      :lat => "",
      :description => "MyText",
      :address => "MyText"
    ))
  end

  it "renders the edit spot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => spots_path(@spot), :method => "post" do
      assert_select "input#spot_name", :name => "spot[name]"
      assert_select "input#spot_lng", :name => "spot[lng]"
      assert_select "input#spot_lat", :name => "spot[lat]"
      assert_select "textarea#spot_description", :name => "spot[description]"
      assert_select "textarea#spot_address", :name => "spot[address]"
    end
  end
end
