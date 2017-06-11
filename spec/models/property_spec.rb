require 'rails_helper'

RSpec.describe Property do
  describe 'in_area' do
    it 'returns all records inside the given area' do
      property1 = Property.create(x: 10, y:10)
      property2 = Property.create(x: 20, y:20)
      property3 = Property.create(x: 21, y: 21)

      result = Property.in_area(10, 20, 10, 20)

      expect(result.size).to eq 2
      expect(result).to include(property1)
      expect(result).to include(property2)
    end
  end
end
