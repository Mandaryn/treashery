class Locality
  include Mongoid::Document
  field :name, type: String
  field :type, type: Array, default: []
  field :neLat, type: Float
  field :neLng, type: Float
  field :swLat, type: Float
  field :swLng, type: Float

  validates :name, :type, :neLat, :neLng, :swLat, :swLng, presence: true
  validates :neLat, :swLat, numericality: {greater_than_or_equal_to: -90, less_than_or_equal_to: 90}
  validates :neLng, :swLng, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}

  has_many :localities
  has_many :spots
  belongs_to :locality

  accepts_nested_attributes_for :localities

  TYPES = %w(route intersection political country administrative_area_level_1 administrative_area_level_2 administrative_area_level_3 colloquial_area locality sublocality neighborhood postal_code natural_feature airport park point_of_interest)
end