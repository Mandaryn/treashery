class Spot
  include Mongoid::Document
  field :name, :type => String
  field :lng, :type => BigDecimal
  field :lat, :type => BigDecimal
  field :description, :type => String
  field :address, :type => String
end
