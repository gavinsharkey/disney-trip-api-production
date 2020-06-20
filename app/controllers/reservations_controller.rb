class ReservationsController < ApplicationController
  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: reservation, include: {reservable: { only: [:name] } }, except: [:created_at, :updated_at]
    else
      render json: { errors: 'All Fields Required' }
    end
  end

  def destroy
    reservation = Reservation.find_by(id: params[:id])
    reservation.destroy
    render json: reservation, include: [:reservable]
  end

  private

  def reservation_params
    params.require(:reservation).permit(:day_id, :reservable_id, :reservable_type, :time)
  end
end