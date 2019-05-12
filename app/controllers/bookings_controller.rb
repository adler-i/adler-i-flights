class BookingsController < ApplicationController

  def confirm
    session[:booking_params] = booking_params
    @booking_params = booking_params
    @flight = Flight.find(session[:flight_id])

    render format: :js
  end

  def book
    session[:flight_id] ||= params[:selected_flight]

    render format: :js
  end

  def payment
    flight = session[:flight_id]

    @booking = Booking.create(
        flight_id: flight,
        user_id: User.find(session[:user_id]).id,
        ticket_number: (0...8).map { (65 + rand(26)).chr }.join
    )
    redirect_to past_bookings_path
  end

  private
  def booking_params
    passenger_fields = %w(name)
    params.permit(
      adult: passenger_fields
    )
  end
end
