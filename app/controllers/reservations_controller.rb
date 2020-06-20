class ReservationsController < ApplicationController
  def create
    day = Day.find_by(id: params[:day_id])
    reservation = day.reservations.build(reservation_params)
    if reservation.save
      render json: reservation, include: {reservable: { only: [:name] } }, except: [:created_at, :updated_at]
    else
      render json: { errors: 'All Fields Required' }
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservable_id, :reservable_type, :time)
  end
end