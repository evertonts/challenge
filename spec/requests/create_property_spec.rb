require 'rails_helper'

RSpec.describe 'Creating a new property' do
  it 'returns 201 for a valid request' do
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
end
