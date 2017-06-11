class PropertiesController < ApplicationController
  def create
    @property = Property.new(property_params)

    @property.save

    render :show, status: :created
  end

  def show
    @property = Property.find(params[:id])
  end

  def index
    @properties = Property.in_area(params[:ax], params[:bx], params[:ay], params[:by])
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
