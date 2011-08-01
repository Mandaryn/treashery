class Viewport
  include Mongoid::Document

  field :southwest, type: Point
  field :northeast, type: Point

  validates :southwest, :northeast, presence: true
end
