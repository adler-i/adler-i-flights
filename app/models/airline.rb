class Airline < ApplicationRecord
  validates :name, :email, presence: true
  has_many :flights
  default_scope { order(name: :asc) }
  has_secure_password
end
