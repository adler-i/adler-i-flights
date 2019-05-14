class BookingsController < ApplicationController

  def confirm
    if session[:user_id].nil? or (session[:user_id].present? or User.find(session[:user_id]).nil?)
      user = User.create_user_from_booking booking_params
      if user
        @@userid = user.id
      end
      session[:user_id] = @@userid
    end
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
        user_id: @@userid,
        ticket_number: (0...8).map { (65 + rand(26)).chr }.join
    )
    redirect_to past_bookings_path
  end

  private
  def booking_params
    passenger_fields = %w(name email)
    params.permit(
      adult: passenger_fields
    )
  end
end
