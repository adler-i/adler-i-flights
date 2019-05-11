class BookingsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings_users do |t|
      t.references :user
      t.references :booking

      t.timestamps null: false
    end
  end
end
