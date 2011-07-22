require 'spec_helper'

describe Spot do
  describe "Spot.bounded" do
    before(:each) do
      @spotInside = Spot.create!(:name => "spotInside", :lng => 30.0, :lat => 30.0 )
      @spotOutside = Spot.create!(:name => "spotOutside", :lng => 10.0, :lat => 5.0 )
    end
    
    it  "should show spots inside bounds" do
      #dodaj spot do tablicy
      Spot.bounded(20,20,40,40).to_a.should eq([@spotInside])
    end
    
    it "should return all spots" do
      Spot.all.to_a
    end
    
    it "should not return spot that is outside bounds" do
      Spot.bounded(20,20,40,40).to_a.should_not eq([@spotOutside])
    end
    
    it "should return all spots if bounded doesn't have any attributes" do
      Spot.bounded(nil, nil, nil, nil).to_a.should eq([@spotInside, @spotOutside])
    end

  end
end