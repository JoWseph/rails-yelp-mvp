require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
15.times do
  restaurant = Restaurant.new
  restaurant.name = Faker::Restaurant.name
  restaurant.address = Faker::Address.full_address
  restaurant.phone_number = Faker::PhoneNumber.phone_number_with_country_code
  restaurant.category = %w[chinese italian japanese french belgian].sample
  restaurant.save!
  rand(5..15).times do
    review = Review.new
    review.restaurant = restaurant
    review.rating = rand(1..5)
    review.content = Faker::Restaurant.review
    review.save!
  end
end
puts 'Restaurants created !'
