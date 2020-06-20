class RestaurantsController < ApplicationController
  def index
    if params[:park_id]
      park = Park.find_by(id: params[:park_id])
      restaurants = park.restaurants
      render json: restaurants, except: [:created_at, :updated_at]
    elsif params[:resort_id]
      resort = Resort.find_by(id: params[:resort_id])
      restaurants = resort.restaurants
      render json: restaurants, except: [:created_at, :updated_at]
    end
  end
end