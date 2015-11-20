class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validate :check_availability
    

	def check_availability
      if guests > restaurant.capacity
      	self.errors.add(:guests, 'Sorry capacity is full')
      end
	end

end
