class AddressComponent
  include Mongoid::Document

  field :long_name, type: String
  field :short_name, type: String
  field :types, type: Array

  embedded_in :locality, inverse_of: :address_components
end
