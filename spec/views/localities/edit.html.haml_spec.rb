require 'spec_helper'

describe "localities/edit.html.haml" do
  before(:each) do
    @locality = assign(:locality, stub_model(Locality,
      :name => "MyString",
      :types => ['political', 'route'],
      :neLat => 1.5,
      :neLng => 1.5,
      :swLat => 1.5,
      :swLng => 1.5
    ))
  end

  it "renders the edit locality form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => localities_path(@locality), :method => "post" do
      assert_select "input#locality_name", :name => "locality[name]"
      assert_select "input[type=checkbox][value='political'][checked='checked']", :count => 1
      assert_select "input[type=checkbox][value='route'][checked='checked']", :count => 1
      assert_select "input#locality_neLat", :name => "locality[neLat]"
      assert_select "input#locality_neLng", :name => "locality[neLng]"
      assert_select "input#locality_swLat", :name => "locality[swLat]"
      assert_select "input#locality_swLng", :name => "locality[swLng]"
    end
  end
end
