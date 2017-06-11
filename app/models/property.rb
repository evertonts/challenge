class Property < ApplicationRecord
  alias_attribute :squareMeters, :square_meters

  scope :in_area, -> (ax, bx, ay, by) { where(x: ax..bx, y: ay..by) }

  def provinces
    []
  end
end
