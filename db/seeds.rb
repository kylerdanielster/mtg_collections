# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

#http://via.placeholder.com/150x225

Card.create!(name:  "Card",
             imageUri: "http://via.placeholder.com/150x225")

99.times do |n|
  name  = Faker::Book.title
  imageUri = "http://via.placeholder.com/150x225"
  Card.create!(name:  name,
               imageUri: imageUri)
end

users = User.order(:created_at).take(6)
10.times do
  name = Faker::Lorem.sentence(3)
  users.each { |user| user.collections.create!(name: name, user_id: user.id) }
end

collections = Collection.all
collections.each { |collection|
  cards = Card.order("RANDOM()").limit(20)
  cards.each { |card| Cardcollection.create!(card_id: card.id, collection_id: collection.id) }
  }
