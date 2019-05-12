class FlightsController < ApplicationController
  protect_from_forgery except: [:search, :seats_available]

  def search
    @retrieved_flights = Flight.search(
      params[:departs],
      params[:arrives],
      search_date,
      params[:adults]
    )

    render format: :js
  end

  private
    def search_date
      Time.zone.parse(params[:date])
    end
end
