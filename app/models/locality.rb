class Locality
  TYPES = %w(country administrative_area_level_1 administrative_area_level_2 administrative_area_level_3 locality sublocality neighborhood natural_feature airport park point_of_interest)

  include Mongoid::Document
  field :name, type: String
  field :formatted_address, type: String
  field :types, type: Array, default: []
  field :neLat, type: Float
  field :neLng, type: Float
  field :swLat, type: Float
  field :swLng, type: Float

  validates :name, :types, :neLat, :neLng, :swLat, :swLng, presence: true
  validates :neLat, :swLat, numericality: {greater_than_or_equal_to: -90, less_than_or_equal_to: 90}
  validates :neLng, :swLng, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}

  has_many :localities
  has_many :spots
  belongs_to :locality

  def geometry=(value) #set bounds from geocoding results property
    self.neLat = value["viewport"]["northeast"]["lat"]
    self.neLng = value["viewport"]["northeast"]["lng"]
    self.swLat = value["viewport"]["southwest"]["lat"]
    self.swLng = value["viewport"]["southwest"]["lng"]
  end
end
