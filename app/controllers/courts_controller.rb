class CourtsController < ApplicationController
  before_action :set_court, only: [:show, :edit, :update, :destroy]

  def index
    @courts = Court.all
  end

  def show
  end

  def new
    @court = Court.new
  end

  def create
    @court = Court.new(court_params)
    @court.availability = ActiveModel::Type::Boolean.new.cast(params[:court][:availability])
    @court.user = current_user

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
  end

  def court_params
    params.require(:court).permit(:name, :location, :availabity, :pricing, :capacity)
  end
end
