class Spot
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  embeds_one :location, class_name: 'Point'
  accepts_nested_attributes_for :location
  field :coordinates, type: Array
  index [[ :coordinates, Mongo::GEO2D ]], min: -180, max: 180

  field :name, type: String
  field :description, type: String

  before_save :set_coordinates
  before_save :reverse_geocode

  validates :name, presence: true
  paginates_per 10

  scope :bounded, ->(swLng, swLat, neLng, neLat) {
    if swLng.present? && swLat.present? && neLng.present? && neLat.present?
      where(:coordinates.within => {"$box" => [[swLng.to_f, swLat.to_f], [neLng.to_f, neLat.to_f]]})
    else
      all
    end
  }

  def set_coordinates
    self.coordinates = [location.lat, location.lng]
  end

  def reverse_geocode
    Geocoder.search(coordinates).reverse.each do |result|
      Locality.create(result.data)
    end
  end
end
