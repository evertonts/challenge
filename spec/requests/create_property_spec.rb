require 'rails_helper'

RSpec.describe 'Creating a new property' do
  it 'returns created for a valid request' do
    params = {
      x: 22,
      y: 44,
      title: "Test Property",
      price: 1_000_000,
      description: "Nice house close to the beach",
      beds: 4,
      baths: 3,
      squareMeters: 210
    }

    post '/properties', params: params

    expect(response).to have_http_status(:created)
    expect(json).to eq ({
      id: Property.last.id,
      x: 22,
      y: 44,
      title: "Test Property",
      price: "1000000.0",
      description: "Nice house close to the beach",
      beds: 4,
      baths: 3,
      squareMeters: 210
    })
  end

  it 'returns unprocessable entity if creating with invalid attributes' do
    params = {
      x: 22,
      y: 44,
      title: "Test Property",
      price: 1_000_000,
      description: "Nice house close to the beach",
      beds: 8,
      baths: 5,
      squareMeters: 250
    }

    post '/properties', params: params

    expect(response).to have_http_status(:unprocessable_entity)
    expect(json[:errors]).to include(:square_meters)
    expect(json[:errors]).to include(:beds)
    expect(json[:errors]).to include(:baths)
  end
end
