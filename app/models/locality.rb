class Locality
  include Mongoid::Document

  field :formatted_address, type: String
  field :types, type: Array, default: []
  embeds_many :address_component
  embeds_one :geometry

  validates :formatted_address, :types, :geometry, presence: true

  validates_uniqueness_of :formatted_address, scope: [:type, :address_component]
end
