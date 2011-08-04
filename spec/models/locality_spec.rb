#encoding: utf-8
require 'spec_helper'

describe Locality do
  context "when spot is created" do
    before do
      Factory(:spot, name: "Geolocalized", location: Point.new(lng: 30.0, lat: 30.0))
    end

    it "should be created from google reverse geocoding" do
      Locality.all[0].formatted_address.should == "Egypt"
      Locality.all[0].types.should == ["country", "political"]

      Locality.all[1].formatted_address.should == "Matrouh, Egypt"
      Locality.all[1].types.should == ["administrative_area_level_1", "political"]

      Locality.all[2].formatted_address.should == "Markaz El-hamam, Matrouh, Egypt"
      Locality.all[2].types.should == ["administrative_area_level_2", "political"]

      Locality.all[3].formatted_address.should == "Wadi Al Netroun - Al Deblomasein Rd, Markaz El-hamam, Egypt"
      Locality.all[3].types.should == ["route"]

      Locality.count.should == 4
    end

    it "should be nested according to address components hierarchy" do
      egypt = Locality.all[0]
      egypt.formatted_address.should == "Egypt"

      matrouh = egypt.localities.first
      matrouh.formatted_address.should == "Matrouh, Egypt"

      markaz = matrouh.localities.first
      markaz.formatted_address.should == "Markaz El-hamam, Matrouh, Egypt"

      wadi = markaz.localities.first
      wadi.formatted_address.should == "Wadi Al Netroun - Al Deblomasein Rd, Markaz El-hamam, Egypt"
    end
  end

  context "when two spots are created" do
    before do
      Factory(:spot, name: "Geolocalized", location: Point.new(lng: 30.0, lat: 30.0))
      Factory(:spot, name: "Geolocalized", location: Point.new(lng: 30.2, lat: 30.2))
    end

    it "should only create unique localities" do
      Locality.all[0].formatted_address.should == "Egypt"
      Locality.all[0].types.should == ["country", "political"]

      Locality.all[1].formatted_address.should == "Matrouh, Egypt"
      Locality.all[1].types.should == ["administrative_area_level_1", "political"]

      Locality.all[2].formatted_address.should == "Markaz El-hamam, Matrouh, Egypt"
      Locality.all[2].types.should == ["administrative_area_level_2", "political"]

      Locality.all[3].formatted_address.should == "Wadi Al Netroun - Al Deblomasein Rd, Markaz El-hamam, Egypt"
      Locality.all[3].types.should == ["route"]

      Locality.all[4].formatted_address.should == "Al - Behaira, Egypt"
      Locality.all[4].types.should == ["administrative_area_level_1", "political"]

      Locality.count.should == 5
    end

    it "should be nested according to address components hierarchy" do
      egypt = Locality.all[0]
      egypt.formatted_address.should == "Egypt"

      behaira = egypt.localities.last
      behaira.formatted_address.should == "Al - Behaira, Egypt"

      matrouh = egypt.localities.first
      matrouh.formatted_address.should == "Matrouh, Egypt"

      markaz = matrouh.localities.first
      markaz.formatted_address.should == "Markaz El-hamam, Matrouh, Egypt"

      wadi = markaz.localities.first
      wadi.formatted_address.should == "Wadi Al Netroun - Al Deblomasein Rd, Markaz El-hamam, Egypt"
    end
  end
  
  context "when spot is scoped" do
    before do
      @locality = Factory(:locality, :'address_components.long_name' => 'Polska')
    end
    
    it "should return only localities that are in search scope" do
      Locality.search('Polska').to_a.first.should eq(@locality)
    end
  end
end
