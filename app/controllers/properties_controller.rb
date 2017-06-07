class PropertiesController < ApplicationController
  def create
    @property = Property.new(property_params)

    @property.save

    render :show, status: :created
  end

  private

  def property_params
    params.permit(
      :x,
      :y,
      :title,
      :price,
      :description,
      :beds,
      :baths,
      :squareMeters
    )
  end
end
