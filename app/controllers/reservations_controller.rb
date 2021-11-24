class ReservationsController < ApplicationController

  def create
    @court = Court.find(params[:court_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.court = @court
    authorize @reservation
    if @reservation.save!
      redirect_to court_path(@court)
    else
      redirect_to courts_path
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.destroy
    redirect_to court_path(@reservation.court)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :end_date)
  end
end
