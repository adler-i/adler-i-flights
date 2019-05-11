class Flight < ApplicationRecord
  has_many   :bookings
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport,   class_name: "Airport"
  belongs_to :airline

  def self.search(departs, arrives, date, total_passengers)
    where("date = ? and seats > ? and from_airport_id = '#{departs}' and to_airport_id = '#{arrives}'", date, total_passengers)
  end
end
