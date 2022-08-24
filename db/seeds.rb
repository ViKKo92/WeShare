# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

10.times do |i|
  user = User.new(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    home_address: Faker::Address.full_address,
    email: "user#{i + 1}@gmail.com",
    password: 123123
  )
  user.save!

  book = Item.new(
    name: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    category: "Books",
    price_per_day: Faker::Number.between(from: 0.1, to: 20.0).round(1),
    user_id: user.id
  )
  book.save!

  vehicle = Item.new(
    name: Faker::Vehicle.make_and_model,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    category: "Vehicles",
    price_per_day: Faker::Number.between(from: 20.0, to: 400.0).round(1),
    user_id: user.id
  )
  vehicle.save!

  electronics = Item.new(
    name: "#{Faker::Device.manufacturer} #{Faker::Device.model_name}",
    description: Faker::Lorem.paragraph(sentence_count: 10),
    category: "Electronics",
    price_per_day: Faker::Number.between(from: 5.0, to: 25.0).round(1),
    user_id: user.id
  )
  electronics.save!

  room = Item.new(
    name: "Apartment with a nice #{Faker::House.room}",
    description: Faker::Lorem.paragraph(sentence_count: 10),
    category: "Rooms",
    price_per_day: Faker::Number.between(from: 50.0, to: 200.0).round(1),
    user_id: user.id
  )
  room.save!

  tool = Item.new(
    name: Faker::Construction.heavy_equipment,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    category: "Tools",
    price_per_day: Faker::Number.between(from: 30.0, to: 120.0).round(1),
    user_id: user.id
  )
  tool.save!

end

rental1 = Rental.new(
  start_date: Date.new(2022,9,11),
  end_date: Date.new(2022,9,15),
  user_id: User.first.id,
  item_id: Item.last.id
)
rental1.save!

rental2 = Rental.new(
  start_date: Date.new(2022,9,11),
  end_date: Date.new(2022,9,15),
  user_id: User.last.id,
  item_id: Item.first.id
)
rental2.save!