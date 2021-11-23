class CourtsController < ApplicationController
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
  end

  def destroy
  end

  private

  def court_params
    params.require(:court).permit(:name, :location, :availabity, :pricing, :capacity)
  end

end
