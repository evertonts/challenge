class PropertiesController < ApplicationController
  def create
    @property = Property.new(property_params)

    if @property.save
      render :show, status: :created
    else
      render 'commons/errors', status: :unprocessable_entity, locals: { errors: @property.errors }
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def index
    @properties = Property.includes(:provinces).in_area(params[:ax], params[:bx], params[:ay], params[:by])
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
