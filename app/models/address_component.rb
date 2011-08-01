class AddressComponent
  include Mongoid::Document

  field :long_name, type: String
  field :short_name, type: String
  field :types, type: String
end
