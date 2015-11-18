class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :price
      t.string :type
      t.timestamps null: false
    end
  end
end
