require 'spec_helper'

describe "spots/edit.html.haml" do
  before do
    @spot = assign(:spot, Factory.stub(:spot))
  end

  it "renders the edit spot form" do
    render

    assert_select "form", :action => spots_path(@spot), :method => "post" do
      assert_select "input#spot_name", :name => "spot[name]"
      assert_select "input#spot_location_attributes_lng", :name => "spot[location_attributes][lng]"
      assert_select "input#spot_location_attributes_lat", :name => "spot[location_attributes][lat]"
      assert_select "textarea#spot_description", :name => "spot[description]"
    end
  end
end