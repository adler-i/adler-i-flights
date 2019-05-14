class Airline < ApplicationRecord
  default_scope { order(name: :asc) }
  has_secure_password
end
