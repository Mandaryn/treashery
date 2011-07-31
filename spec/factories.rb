Factory.sequence :name do |n|
  "Nazwa #{n}"
end

Factory.define :locality do |f|
  f.name { Factory.next(:name) }
  f.types ['country']
  f.neLat 25.0
  f.neLng 25.2
  f.swLat 20.0
  f.swLng 20.2
end

Factory.define :spot do |f|
  f.name { Factory.next(:name) }
  f.lat 20.0
  f.lng 20.2
end
