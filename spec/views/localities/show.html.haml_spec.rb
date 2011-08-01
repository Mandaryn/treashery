#encoding: utf-8
require 'spec_helper'

describe "localities/show.html.haml" do
  before(:each) do
    @locality = assign(:locality, Factory.stub(:locality, formatted_address: 'Łódź', types: ['sublocality']))
  end

  it "renders attributes" do
    render
    rendered.should match(/Łódź/)
    rendered.should match(/sublocality/)
  end
end
