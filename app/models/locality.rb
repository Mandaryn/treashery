class Locality
  include Mongoid::Document

  field :formatted_address, type: String
  field :types, type: Array, default: []
  embeds_many :address_components, class_name: 'AddressComponent'
  embeds_one :geometry

  validates :formatted_address, :types, :geometry, presence: true
  belongs_to :locality
  has_many :localities

  validates_uniqueness_of :formatted_address, scope: [:type, :address_component]

  def find_best_parent(localities_array)
    localities_array.min do |a,b|
      (self.address_components.map(&:short_name) - a.address_components.map(&:short_name)).size <=> (self.address_components.map(&:short_name) - b.address_components.map(&:short_name)).size
    end
  end
end
