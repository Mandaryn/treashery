require 'spec_helper'

describe "spots/new.html.haml" do
  before do
    assign(:spot, Factory.build(:spot))
  end

  it "renders new spot form" do
    render

    assert_select "form", :action => spots_path, :method => "post" do
      assert_select "input#spot_name", :name => "spot[name]"
      assert_select "input#spot_location_attributes_lng", :name => "spot[location_attributes][lng]"
      assert_select "input#spot_location_attributes_lat", :name => "spot[location_attributes][lat]"
      assert_select "textarea#spot_description", :name => "spot[description]"
    end
  end
end