#encoding: utf-8
require 'spec_helper'

describe "localities/show.html.haml" do
  before(:each) do
    @locality = assign(:locality, Factory.stub(:locality, neLat: 20, neLng:20.1, swLat: 10, swLng:10.1, name: 'Łódź', types: ['sublocality']))
  end

  it "renders attributes" do
    render
    rendered.should match(/Łódź/)
    rendered.should match(/sublocality/)
    rendered.should match(/20.0/)
    rendered.should match(/20.1/)
    rendered.should match(/10.0/)
    rendered.should match(/10.1/)
  end
end
