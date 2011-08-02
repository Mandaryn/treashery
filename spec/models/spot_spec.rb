require 'spec_helper'

describe Spot do
  describe ".bounded" do
    before do
      @inside = Factory(:spot, location: Point.new(lng: 30.0, lat: 30.0))
      @outside = Factory(:spot, location: Point.new(lng: 10.0, lat: 5.0))
    end

    it "should show spots inside bounds" do
      Spot.bounded(20,20,40,40).to_a.should eq([@inside])
    end

    it "should not return spot that is outside bounds" do
      Spot.bounded(20,20,40,40).to_a.should_not eq([@outside])
    end

    it "should return all spots if bounded doesn't have any attributes" do
      Spot.bounded(nil, nil, nil, nil).to_a.should eq([@inside, @outside])
    end
  end

  describe ".create" do
    before do
      @spot = Factory(:spot, location: Point.new(lng: 30.0, lat: 30.0))
    end

    it "should set parent_localities" do
      @spot.localities.count.size == 4
      @spot.localities[0].formatted_address.should == "Egypt"
      @spot.localities[1].formatted_address.should == "Matrouh, Egypt"
      @spot.localities[2].formatted_address.should == "Markaz El-hamam, Matrouh, Egypt"
      @spot.localities[3].formatted_address.should == "Wadi Al Netroun - Al Deblomasein Rd, Markaz El-hamam, Egypt"
    end
  end

  describe '.typed' do
    before do
      @medical = Factory(:spot, type: "medical")
      @other = Factory(:spot, type: "other")
    end
    
    it 'should return only Medical waste spots' do
      Spot.bounded(nil, nil, nil, nil).typed("medical").to_a.should eq([@medical])
    end
    
    it 'should return all spots' do
      Spot.bounded(nil, nil, nil, nil).typed(nil).to_a.should eq([@medical, @other])
    end
  end
end
