#encoding: utf-8
require 'spec_helper'

describe "spots/show.html.haml" do
  before(:each) do
    @spot = assign(:spot, Factory.stub(:spot, name: "Śmieci", description: 'duże', lat: 10.0, lng: 10.2))
  end

  it "renders attributes" do
    render
    rendered.should match(/Śmieci/)
    rendered.should match(/10.0/)
    rendered.should match(/10.2/)
    rendered.should match(/duże/)
  end
end