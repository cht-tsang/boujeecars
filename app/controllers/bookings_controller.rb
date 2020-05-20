class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
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
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @Booking.destroy
    redirect_to car_path(@booking.car)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id)
  end
end
