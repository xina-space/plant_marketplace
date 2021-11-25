class BookingsController < ApplicationController


#   def show
#     @booking = Booking.find(params[:id])
#   end

def new
  @plant = Plant.find(params[:plant_id])
  @booking = Booking.new
  authorize @booking
end

def create
  @plant = Plant.find(params[:plant_id])
  @booking = Booking.new(booking_params)
  @booking.plant = @plant
  @booking.user = current_user
  authorize @booking
  if @booking.save
    redirect_to dashboard_path
  else
    render "plants/show"
  end
end

private

  def booking_params
    params.require(:booking).permit(:plant_id, :user_id, :start_date, :end_date)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_plant
    @plant = Plant.find(params[:plant_id])
  end
end
