Factory.sequence :name do |n|
  "Nazwa #{n}"
end

Factory.sequence :long_name do |m|
  "Long name #{m}"
end

Factory.define :locality do |f|
  f.formatted_address { Factory.next(:name) }
  f.address_components { [Factory.next(:long_name)] }
  f.types ['country']
  f.geometry { Geometry.new }
end

Factory.define :spot do |f|
  f.name { Factory.next(:name) }
  f.type { 'medical' }
  f.location { Point.new(lat: 20.1, lng: 20.2) }
end
 