require 'faker'

puts "Clearing database..."
Restaurant.destroy_all

puts "Creating restaurants..."
50.times do
  print "#"
  Restaurant.create!(
    name: Faker::Restaurant.name,
    category: Restaurant::CATEGORIES.sample,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

puts ""
puts "Creating reviews..."
100.times do
  print "#"
  review = Review.new(
    content: Faker::TvShows::TheExpanse.quote,
    rating: rand(6)
  )
  review.restaurant = Restaurant.all.sample
  review.save!
end
