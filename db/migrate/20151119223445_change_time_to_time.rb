class ChangeTimeToTime < ActiveRecord::Migration
  def change
  	change_column :reservations, :time, :time 
  end
end