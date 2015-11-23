class User < ActiveRecord::Base
	has_secure_password
	has_many :reservations
	has_many :reserved_restaurants, through: :reservations, source: :restaurant
	has_many :restaurants
end
