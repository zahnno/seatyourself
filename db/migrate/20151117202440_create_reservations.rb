class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :capacity
      t.integer :time
      t.timestamps null: false
    end
  end
end
