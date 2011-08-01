Factory.sequence :name do |n|
  "Nazwa #{n}"
end

Factory.define :locality do |f|
  f.formatted_address { Factory.next(:name) }
  f.types ['country']
  f.geometry { Geometry.new }
end

Factory.define :spot do |f|
  f.name { Factory.next(:name) }
  f.location { Point.new(lat: 20.1, lng: 20.2) }
end

#<Locality _id: 4e35d58386cc26da56000006, _type: nil, formatted_address: "Wadi Al Netroun - Al Deblomasein Rd, Markaz El-hamam, Egypt", types: ["route"], geometry: {"bounds"=>{"northeast"=>{"lat"=>30.3508686, "lng"=>30.3141751}, "southwest"=>{"lat"=>30.089016, "lng"=>30.0305441}}, "location"=>{"lat"=>30.2424259, "lng"=>30.15507989999999}, "location_type"=>"APPROXIMATE", "viewport"=>{"northeast"=>{"lat"=>30.3508686, "lng"=>30.3141751}, "southwest"=>{"lat"=>30.089016, "lng"=>30.0305441}}}, spot_ids: [], address_components: [{"long_name"=>"Wadi Al Netroun - Al Deblomasein Rd", "short_name"=>"Wadi Al Netroun - Al Deblomasein Rd", "types"=>["route"]}, {"long_name"=>"Markaz El-hamam", "short_name"=>"Markaz El-hamam", "types"=>["administrative_area_level_2", "political"]}, {"long_name"=>"Egypt", "short_name"=>"EG", "types"=>["country", "political"]}]> 