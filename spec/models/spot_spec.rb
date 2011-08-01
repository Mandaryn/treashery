require 'spec_helper'

describe Spot do
  describe ".bounded" do
    before do
      @inside = Factory(:spot, name: "inside", location: Point.new(lng: 30.0, lat: 30.0))
      @outside = Factory(:spot, name: "outside", location: Point.new(lng: 10.0, lat: 5.0))
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
end
