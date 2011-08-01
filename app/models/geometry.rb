class Geometry
  include Mongoid::Document

  field :location, type: Point
  field :location_type, type: String
  field :viewport, type: Viewport
end