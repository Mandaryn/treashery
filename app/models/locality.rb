class Locality
  include Mongoid::Document

  field :formatted_address, type: String
  field :types, type: Array, default: []
  embeds_many :address_component
  embeds_one :geometry

  validates :formatted_address, :types, :geometry, presence: true
  belongs_to :locality
  has_many :localities

  validates_uniqueness_of :formatted_address, scope: [:type, :address_component]

  def find_best_parent(localities_array)
    localities_array.min do |a,b| 
      (self.address_components - a.address_components).size <=> (self.address_components - b.address_components).size
    end
  end
end
