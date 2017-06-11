json.foundProperties @properties.size

json.properties do
  json.array!(@properties) do |property|
    json.partial!('/commons/property', property: property)
    json.provinces do
      json.partial!('/commons/provinces', provinces: property.provinces)
    end
  end
end
