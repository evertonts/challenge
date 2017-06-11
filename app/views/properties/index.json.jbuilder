json.foundProperties @properties.size

json.properties do
  json.array!(@properties) do |property|
    json.partial!('/commons/property', property: property)
    json.provinces property.provinces
  end
end
