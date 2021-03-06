class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @cars = Car.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      flash[:alert] = 'Booking Successfull!'
      redirect_to car_booking_path(@car, @booking)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:car_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @car = Car.find(params[:car_id])
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to car_booking_path(@car, @booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id)
  end
end
