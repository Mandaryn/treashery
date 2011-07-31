require 'spec_helper'

describe "localities/index.html.haml" do
  before(:each) do
    assign(:localities, [
      stub_model(Locality,
        :name => "Name",
        :types => ['country'],
        :neLat => 1.5,
        :neLng => 1.6,
        :swLat => 1.7,
        :swLng => 1.8
      ),
      stub_model(Locality,
        :name => "Name",
        :types => ['country'],
        :neLat => 1.5,
        :neLng => 1.6,
        :swLat => 1.7,
        :swLng => 1.8
      )
    ])
  end

  it "renders a list of localities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "ul>li", :text => "country".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
