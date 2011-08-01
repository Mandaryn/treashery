class Point
  include Mongoid::Document

  field :lat, type: Float
  field :lng, type: Float
end