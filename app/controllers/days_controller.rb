class DaysController < ApplicationController
  before_action :set_day, only: [:show, :destroy]

  def index
    trip = Trip.find_by(id: params[:trip_id])
    @days = trip.days
    render json: @days, include: {reservations: { include: {reservable: {except: [:created_at, :updated_at]}}, except: [:created_at, :updated_at]}}, except: [:created_at, :updated_at], methods: [:place]
  end

  def create
    trip = Trip.find_by(id: params[:trip_id])
    @day = trip.days.build
    if @day.save
      render json: @day, include: [:reservations], methods: [:place]
    else
      render json: {errors: @day.errors.full_messages}
    end
  end

  def show
    render json: @day, include: {reservations: { include: {reservable: {except: [:created_at, :updated_at]}}, except: [:created_at, :updated_at]}}, except: [:created_at, :updated_at], methods: [:place]
  end

  def destroy
    @day.destroy
    render json: @day, except: [:created_at, :updated_at]
  end

  private

  def set_day
    @day = Day.find_by(id: params[:id])
  end
end