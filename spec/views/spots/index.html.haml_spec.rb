require 'spec_helper'

describe "spots/index.html.haml" do
  before(:each) do
    assign(:spots, [
      stub_model(Spot,
        :name => "Name",
        :lng => "10.0",
        :lat => "12.0",
        :description => "MyText",
        :address => "MyText2"
      ),
      stub_model(Spot,
        :name => "Name",
        :lng => "10.0",
        :lat => "12.0",
        :description => "MyText",
        :address => "MyText2"
      )
    ])
  end

  it "renders a list of spots" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name", :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "10.0", :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "12.0", :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText", :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText2", :count => 2
  end
end
