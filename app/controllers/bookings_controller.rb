class BookingsController < ApplicationController
  include Bookings
  before_action :set_booking, only: [:retrieve, :destroy, :update]
  protect_from_forgery except: [:retrieve, :destroy]

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
  end


  def retrieve
    render format: :js
  end

  def search
  end

  def update
    @booking.update_passengers(booking_params)
    redirect_to search_booking_path, notice: booking_success
  end

  def destroy
    @booking.destroy

    render json: { success: true }
  end

  private

  def set_booking
    @booking = Booking.find_by(reference_number: params[:reference_number])
  end

  def booking_params
    passenger_fields = %w(name)
    params.permit(
      adult: passenger_fields
    )
  end
end
