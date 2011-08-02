class Spot
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  embeds_one :location, class_name: 'Point'
  accepts_nested_attributes_for :location
  field :coordinates, type: Array
  index [[ :coordinates, Mongo::GEO2D ]], min: -180, max: 180

  field :name, type: String
  field :description, type: String
  field :type, type: String

  before_save :set_coordinates
  before_save :reverse_geocode
  has_many :localities

  validates :name, :type, presence: true
  paginates_per 10

  TYPES = %w(medical electronic animal_prod radioactive food other)

  scope :bounded, ->(swLng, swLat, neLng, neLat) {
    if swLng.present? && swLat.present? && neLng.present? && neLat.present?
      where(:coordinates.within => {"$box" => [[swLng.to_f, swLat.to_f], [neLng.to_f, neLat.to_f]]})
    else
      all
    end
  }

  scope :typed, ->(type) {
    if type.present?
      where(:type => type)
    else
      all
    end
  }

  def set_coordinates
    self.coordinates = [location.lng, location.lat]
  end

  def reverse_geocode
    possible_parents = []
    Geocoder.search(coordinates).reverse.each do |result|
      locality = Locality.create(result.data)
      if locality.persisted?
        locality.update_attributes(locality: locality.find_best_parent(possible_parents))
      else
        locality = Locality.where(address_components: result.address_components).first
      end
      possible_parents << locality
    end
    self.localities = possible_parents.compact
  end
end
