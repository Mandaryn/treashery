class Spot
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  field :name, type: String
  field :lng, type: Float
  field :lat, type: Float
  field :location, type: Array
  index [[ :location, Mongo::GEO2D ]], min: -180, max: 180
  field :description, type: String
  field :address, type: String
  field :tags, type: Array, default: []

  reverse_geocoded_by :location do |spot,results|
    spot.tags = GeocodingService.location_tags(results)
    spot.address = GeocodingService.address(results)
    GeocodingService.create_locations(results)
  end
  before_save :generate_location
  before_save :reverse_geocode

  validates :name, :lat, :lng, presence: true
  validates :lat, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  paginates_per 10

  validates_presence_of :name, :lat, :lng
  validates_numericality_of :lat, :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90
  validates_numericality_of :lng, :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180

  belongs_to :locality

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
