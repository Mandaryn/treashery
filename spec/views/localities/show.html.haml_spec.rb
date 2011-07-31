require 'spec_helper'

describe "localities/show.html.haml" do
  before(:each) do
    @locality = assign(:locality, stub_model(Locality,
      :name => "Name",
      :types => ['country'],
      :neLat => 1.5,
      :neLng => 1.5,
      :swLat => 1.5,
      :swLng => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Name/)
    rendered.should match(/country/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
