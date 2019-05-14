class User < ApplicationRecord
  has_many :bookings
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  }

  def self.create_user_from_booking(params)
    user = params[:adult].first
    usr = User.new
    usr.name = user["name"]
    usr.email = user["email"]
    usr.password = "1234"
    usr.password_confirmation = "1234"
    usr.save
    usr
  end
end