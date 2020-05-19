class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

  def create
    @car = Car.find(params[:id])
    @booking = Booking.new()
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_path(@car)
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

  def booking_params
  end
end
