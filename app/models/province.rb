class Province < ApplicationRecord
  has_and_belongs_to_many :properties

  scope :include_point, ->(x, y) do
    where('upper_left_x <= ? AND upper_left_y <= ? AND bottom_right_x >= ? AND bottom_right_y >= ?',x, y, x, y)
  end
end
