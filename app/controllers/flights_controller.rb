class FlightsController < ApplicationController
  protect_from_forgery except: [:search, :seats_available]

  def search
    @retrieved_flights = Flight.search(
      params[:departs],
      params[:arrives],
      search_date,
      total_passengers
    )

    render format: :js
  end

  private

    def total_passengers
      data = {
        total_adults: params[:adults]
      }
      data.values.map(&:to_i).inject(0) { |sum, x| sum + x }
    end

    def search_date
      Time.zone.parse(params[:date])
    end
end
