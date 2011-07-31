require 'spec_helper'

describe "localities/new.html.haml" do
  before(:each) do
    assign(:locality, Locality.new)
  end

  it "renders new locality form" do
    render

    assert_select "form", :action => localities_path, :method => "post" do
      assert_select "input#locality_name", :name => "locality[name]"
      assert_select "input[type=checkbox][checked='checked']", false
      assert_select "input#locality_neLat", :name => "locality[neLat]"
      assert_select "input#locality_neLng", :name => "locality[neLng]"
      assert_select "input#locality_swLat", :name => "locality[swLat]"
      assert_select "input#locality_swLng", :name => "locality[swLng]"
    end
  end
end
