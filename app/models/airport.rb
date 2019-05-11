class Airport < ApplicationRecord
  validates :name, :city, :country, :code, presence: true
  validates :name, :code, uniqueness: true

  has_many :departing_flights, foreign_key: :from_airport_id, class_name: 'Flight'
  has_many :arriving_flights,  foreign_key: :to_airport_id,   class_name: 'Flight'

  scope :names , -> {Airport.pluck(:city, :name, :code, :country).uniq.map { |a| a[0] + " - #{a[1]} " + " - (#{a[2]})" + " - #{a[3]} "}}
end
