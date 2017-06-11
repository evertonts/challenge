require 'rails_helper'

RSpec.describe Property do
  describe 'in_area' do
    it 'returns all records inside the given area' do
      property1 = properties(:property)
      property1.update(x: 10, y:10)

      property2 = properties(:property2)
      property2.update(x: 21, y: 21)

      result = Property.in_area(10, 20, 10, 20)

      expect(result.size).to eq 1
      expect(result).to include(property1)
    end
  end
end
