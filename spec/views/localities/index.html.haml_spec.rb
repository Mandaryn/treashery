#encoding: utf-8
require 'spec_helper'

describe "localities/index.html.haml" do
  before(:each) do
    assign(:localities, [Factory.stub(:locality, name: "Łódź"), Factory.stub(:locality, name: "Łódź")])
  end

  it "renders a list of localities" do
    render
    assert_select "tr>td", :text => "Łódź".to_s, :count => 2
    assert_select "ul>li", :text => "country".to_s, :count => 2
    assert_select "tr>td", :text => 25.0.to_s, :count => 2
    assert_select "tr>td", :text => 25.2.to_s, :count => 2
    assert_select "tr>td", :text => 20.0.to_s, :count => 2
    assert_select "tr>td", :text => 20.2.to_s, :count => 2
  end
end
