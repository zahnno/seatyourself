# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Taco = Restaurant.create(name: "Taco Bell", address: "301 kendalwood", price: "123", genre: "Mexican", user_id: 1, :id 1)

Patrick = User.create(name: "Patrick", email: "zaps@gmail.com", password: "Pat")

italian = Restaurant.create(name:"Donatello", address:"37 Elm St, Toronto, ON M5G 1H1", price: "20$-40$", genre: "Italian", photo: "http://www.blogto.com/listings/restaurants/upload/2008/10/20081013-donatello.jpg", capacity: 40)