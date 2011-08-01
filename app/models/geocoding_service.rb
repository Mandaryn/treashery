class GeocodingService
  def self.location_tags(results)
    results.map(&:address_components).flatten.select{|ac| (ac["types"] & Locality::TYPES).any?}.map{|ac| ac["long_name"]}.uniq
  end

  def self.address(results)
    results.first.address
  end

  def self.create_locations(results)
    results.select{|res| (res.types & Locality::TYPES).any?}.each do |result|
      Locality.create(result.data.merge(name: result.address_components.first["long_name"]))
    end
  end
end