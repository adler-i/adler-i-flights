class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :airline_id
      t.integer :from_airport_id
      t.integer :to_airport_id
      t.datetime :date
      t.integer :seats
      t.float :price

      t.timestamps
    end
  end
end
