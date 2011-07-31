require 'spec_helper'

describe "spots/show.html.haml" do
  before(:each) do
    @spot = assign(:spot, stub_model(Spot,
      :name => "Name",
      :lng => "10.0",
      :lat => "12.0",
      :description => "MyText",
      :address => "MyText2"
    ))
  end

  it "renders attributes" do
    render
    rendered.should match(/Name/)
    rendered.should match(/10.0/)
    rendered.should match(/12.0/)
    rendered.should match(/MyText2/)
    rendered.should match(/MyText/)
  end
end