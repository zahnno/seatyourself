class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validate :check_availability

	validate :past_booking


	def check_availability
      if !restaurant.availability?(guests, time)
      	self.errors.add(:base, "Sorry, Restaurant is full for that time. Please try another time.")
      end
    end

    def past_booking

      if time < Time.now
      	self.errors.add(:base, "Sorry, you cannot book a reservation in the past.")
      end
    end
end
