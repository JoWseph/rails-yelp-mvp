require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
15.times do
  restaurant = Restaurant.new
  restaurant.name = Faker::Restaurant.name
  restaurant.address = Faker::Address.full_address
  restaurant.description = Faker::Restaurant.description
  restaurant.category = %w[chinese italian japanese french belgian].sample
  restaurant.save
  rand(10..20).times do
    Review.create(
      restaurant_id: restaurant,
      content: Faker::Restaurant.review
    )
  end
end
puts 'Restaurants created !'
