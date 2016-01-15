class ChangeTimeToResTime < ActiveRecord::Migration
  def change
  	rename_column :reservations, :time, :restime
  end
end
