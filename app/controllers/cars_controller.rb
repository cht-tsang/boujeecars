class CarsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index

    @cars = Car.geocoded

    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { car: car })
      }
    end

    if params[:query].present?
      # @cars = Car.where("make iLike '%#{params[:query]}%' OR model iLike '%#{params[:query]}%'")
      @cars = Car.search_by_make_and_model(params[:query])
    else
      @cars = Car.all
    end

  end
    
  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to bookings_path
  end
  
  private

  def car_params
    params.require(:car).permit(:make, :model, :price, :photo, :address)
  end
end
