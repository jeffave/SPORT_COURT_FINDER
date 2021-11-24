class CourtsController < ApplicationController
  before_action :set_court, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    # @courts = Court.all
    # nós iremos chamar em nosso court_policy.rb o metodo resolve, que retorna scope.all ( o mesmo que Court.all)
    @courts = policy_scope(Court)
  end

  def show
    @user = current_user
    @reservation = Reservation.new
    @reservation.court = @court
    @reservations = Reservation.where(court_id: @court.id)
    @users = User.all
  end

  def new
    @court = Court.new
    authorize @court
  end

  def create
    @court = Court.new(court_params)
    @court.availability = ActiveModel::Type::Boolean.new.cast(params[:court][:availability])
    @court.user = current_user
    authorize @court

    if @court.save!
      redirect_to courts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @court.availability = ActiveModel::Type::Boolean.new.cast(params[:court][:availability])
    @court.update(court_params)
    if @court.save!
      redirect_to court_path(@court)
    else
      render :edit
    end
  end

  def destroy
    @court.destroy
    redirect_to courts_path
  end

  private

  def set_court
    @court = Court.find(params[:id])
    authorize @court
  end

  def court_params
    params.require(:court).permit(:name, :location, :availabity, :pricing, :capacity)
  end
end
