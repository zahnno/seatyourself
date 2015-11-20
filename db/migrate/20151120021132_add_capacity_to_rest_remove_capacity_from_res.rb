class AddCapacityToRestRemoveCapacityFromRes < ActiveRecord::Migration
  def change
  	add_column :restaurants, :capacity, :integer
  	remove_column :reservations, :capacity
  end
end
