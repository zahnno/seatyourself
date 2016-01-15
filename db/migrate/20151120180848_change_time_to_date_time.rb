class ChangeTimeToDateTime < ActiveRecord::Migration
  def change
  end

    def up
    remove_column :reservations, :restime
    add_column :reservations, :restime, :datetime
  end

  def down
    remove_column :reservations, :restime
    add_column :reservations, :restime, :datetime
  end
end
