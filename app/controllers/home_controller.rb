class HomeController < ApplicationController
  def index
    @airport_names = Airport.names
  end
end
