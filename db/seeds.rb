# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "date"

file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

car = Car.new(make: 'NES', model: "A great console", price: 200, user: User.last)
car.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
car.save

booking = Booking.new(start_date: Date.today,end_date: Date.today, user: User.last, car: car)

booking.save

