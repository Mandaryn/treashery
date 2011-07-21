class Spot
  include Mongoid::Document
  field :name, :type => String
  field :lng, :type => Float
  field :lat, :type => Float
  field :location, :type => Array
  index [[ :location, Mongo::GEO2D ]], min: -180, max: 180
  field :description, :type => String
  field :address, :type => String
  
  validates_presence_of :name, :lat, :lng
  validates_numericality_of :lat, :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90
  validates_numericality_of :lng, :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180
  
  before_save :generate_location

	scope :bounded, ->(swLng, swLat, neLng, neLat) {
    if swLng.present? && swLat.present? && neLng.present? && neLat.present?
  		where(:location.within => {"$box" => [[swLng.to_f, swLat.to_f], [neLng.to_f, neLat.to_f]]})
  	else
  		all
  	end
	}

  protected
  def generate_location
    self.location = [lng, lat]
  end
end
