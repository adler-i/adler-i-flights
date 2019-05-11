class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :user_id
      t.string :ticket_number

      t.timestamps
    end
  end
end
