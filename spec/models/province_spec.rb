require 'rails_helper'

RSpec.describe Province do
  describe '.include_point' do
    it 'returns all provinces that include the point' do
      province1 = Province.create(upper_left_x: 0, upper_left_y: 0, bottom_right_x: 15, bottom_right_y: 15)
      province2 = Province.create(upper_left_x: 10, upper_left_y: 10, bottom_right_x: 20, bottom_right_y: 20)
      province3 = Province.create(upper_left_x: 20, upper_left_y: 20, bottom_right_x: 30, bottom_right_y: 30)

      result = Province.include_point(15, 15)

      expect(result.size).to eq 2
      expect(result).to include(province1)
      expect(result).to include(province2)
    end
  end
end
