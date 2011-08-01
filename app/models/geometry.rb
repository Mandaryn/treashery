class Geometry
  include Mongoid::Document

  field :location, type: Point
  field :location_type, type: String
  field :viewport, type: Viewport

  #validates :location, :location_type, :viewport, presence: true
end