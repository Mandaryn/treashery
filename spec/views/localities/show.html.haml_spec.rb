require 'spec_helper'

describe "localities/show.html.haml" do
  before(:each) do
    @locality = assign(:locality, stub_model(Locality,
      :name => "Name",
      :types => ['route', 'political'],
      :neLat => 1.5,
      :neLng => 1.5,
      :swLat => 1.5,
      :swLng => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/route/)
    rendered.should match(/political/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
