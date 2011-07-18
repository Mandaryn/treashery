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
    rendered.should match(/Name/), :count => 2
  end
end