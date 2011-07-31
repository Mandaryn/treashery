require 'spec_helper'

describe "Show page" do
  before(:each) do
    @spotInside1 = Spot.create!(:name => "insideSpot1", :lng => 20.0, :lat => 51.0)
    @spotInside2 = Spot.create!(:name => "insideSpot2", :lng => 22.0, :lat => 51.0)
    @spotOutside = Spot.create!(:name => "outsideSpot", :lng => 0.0, :lat => 0.0)

    @locality1 = Locality.create!(:name => "Name1",
      :types => ['route', 'political'],
      :neLat => 1.5,
      :neLng => 1.6,
      :swLat => 1.7,
      :swLng => 1.8
    )

    @locality2 = Locality.create!(:name => "Name2",
      :types => ['route', 'political'],
      :neLat => 1.5,
      :neLng => 1.6,
      :swLat => 1.7,
      :swLng => 1.8
    )

    @locality3 = Locality.create!(:name => "Name3",
      :types => ['route', 'political'],
      :neLat => 1.5,
      :neLng => 1.6,
      :swLat => 1.7,
      :swLng => 1.8
    )

    @locality1.spots << @spotInside1
    @locality1.spots << @spotInside2
    @locality3.spots << @spotOutside
  end

  it "should show nested spots" do
    visit locality_path(@locality1)

    page.should have_content('Name1')
    page.should have_content('insideSpot1')
    page.should have_content('insideSpot2')

    visit locality_path(@locality3)
    page.should have_content('Name3')
    page.should have_content('outsideSpot')

  end
end