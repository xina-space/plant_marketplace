class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def dashboard
    @bookings = current_user.bookings
    @bookings_received = Booking.all
  end

  def dashboard_my_plants
    @plants = current_user.plants
  end
end
