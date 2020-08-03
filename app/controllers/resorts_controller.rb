class ResortsController < ApplicationController
  def index
    resorts = Resort.all
    render json: resorts, except: [:created_at, :updated_at]
  end
end