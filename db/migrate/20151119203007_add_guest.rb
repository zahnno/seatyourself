class AddGuest < ActiveRecord::Migration
  def change
  	add_column :reservations, :guests, :integer
  end
end
