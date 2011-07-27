class Locality
  include Mongoid::Document
  field :name, type: String
  field :type, type: Array, default: []
  field :neLat, type: Float
  field :neLng, type: Float
  field :swLat, type: Float
  field :swLng, type: Float
  
  validates_presence_of :name, :type, :neLat, :neLng, :swLat, :swLng
  validates_numericality_of :neLat, :swLat, :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90
  validates_numericality_of :neLng, :swLng, :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180
  
  has_many :localities
  has_many :spots
  belongs_to :locality
  
  accepts_nested_attributes_for :localities

  TYPES = ['street_address',
    'route',
    'intersection',
    'political',
    'country',
    'administrative_area_level_1',
    'administrative_area_level_2',
    'administrative_area_level_3',
    'colloquial_area',
    'locality',
    'sublocality',
    'neighborhood',
    'premise',
    'subpremise',
    'postal_code',
    'natural_feature',
    'airport',
    'park',
    'point_of_interest',
    'post_box',
    'street_number',
    'floor',
    'room']
end