class ParksController < ApplicationController
  def index
    parks = Park.all
    render json: parks, except: [:created_at, :updated_at]
  end
end