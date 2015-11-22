class Restaurant < ActiveRecord::Base
   has_many :reservations
   has_many :users, through: :reservations
   belongs_to :user
  
   def availability? (guests, time)
   	 count_reservation = reservations.where(time: time).sum(:guests)
     guests + count_reservation <= capacity
   end

end
