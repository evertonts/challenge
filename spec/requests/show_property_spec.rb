require 'rails_helper'

RSpec.describe 'Showing a property' do
  it 'returns the property data' do
    property = properties(:property)

    get "/properties/#{property.id}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:ok)
    expect(json).to eq ({
      id: property.id,
      x: property.x,
      y: property.y,
      title: property.title,
      description: property.description,
      price: property.price.to_s,
      beds: property.beds,
      baths: property.baths,
      squareMeters: property.square_meters
    })
  end
end
