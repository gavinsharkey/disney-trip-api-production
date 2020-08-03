class AttractionsController < ApplicationController
  def index
    park = Park.find_by(id: params[:park_id])
    attractions = park.attractions
    render json: attractions, except: [:created_at, :updated_at]
  end
end