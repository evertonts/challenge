class Property < ApplicationRecord
  has_and_belongs_to_many :provinces
  after_create :associate_provinces

  MAX_BEDS = 5
  MAX_BATHS = 4
  MAX_SQUARE_METERS = 240
  MIN_SQUARE_METERS = 20
  MAX_X = 1400
  MAX_Y = 1000

  alias_attribute :squareMeters, :square_meters

  validates :beds, numericality: { less_than_or_equal_to: MAX_BEDS }
  validates :baths, numericality: { less_than_or_equal_to: MAX_BATHS }
  validates :square_meters, numericality: {
    greater_than_or_equal_to: MIN_SQUARE_METERS,
    less_than_or_equal_to: MAX_SQUARE_METERS
  }
  validates :x, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: MAX_X
  }
  validates :y, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: MAX_Y
  }

  scope :in_area, -> (ax, bx, ay, by) { where(x: ax..bx, y: ay..by) }

  def associate_provinces
    self.provinces = Province.include_point(x, y)

    self.save
  end
end
