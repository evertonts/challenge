require 'rails_helper'

RSpec.describe 'Searching a property' do
  it 'returns all properties in the area' do
    property = properties(:property)
    property.update(x: 5, y: 5)
    province = provinces(:province)
    province.update(
      upper_left_x: 0,
      upper_left_y: 0,
      bottom_right_x: 10,
      bottom_right_y: 10
    )

    params = { ax: 0, ay: 0, bx: 10, by: 10 }

    get '/properties', params: params

    expect(response).to have_http_status(:ok)
    expect(json[:foundProperties]).to be 1
    expect(json[:properties]).to eq [{
      id: property.id,
      x: 5,
      y: 5,
      title: property.title,
      description: property.description,
      price: property.price.to_s,
      beds: property.beds,
      baths: property.baths,
      squareMeters: property.squareMeters,
      provinces: [province.name]
    }]
  end

  it 'does not returns properties out of the area' do
    property = properties(:property)
    property.update(x: 5, y: 5)

    params = { ax: 10, ay: 10, bx: 20, by: 20 }

    get '/properties', params: params

    expect(response).to have_http_status(:ok)
    expect(json[:foundProperties]).to eq 0
    expect(json[:properties]).to eq []
  end
end
