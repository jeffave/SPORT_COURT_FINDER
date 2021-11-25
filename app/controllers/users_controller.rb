class UsersController < ApplicationController

  def show
    @users = User.all
    @reservations = Reservation.all
    @courts = Court.all


    @user = User.find(current_user.id)
    authorize @user
  end

end
