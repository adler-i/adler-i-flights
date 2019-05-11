class Airport < ApplicationRecord
  default_scope { order(name: :asc) }

  validates :name, :city, :country, :code, presence: true
  validates :name, :code, uniqueness: true

  has_many :departing_flights, foreign_key: :from_airport_id, class_name: 'Flight'
  has_many :arriving_flights,  foreign_key: :to_airport_id,   class_name: 'Flight'

end
