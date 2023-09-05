# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
2.times do |_index|
  User.create(
    name: Faker::Movies::BackToTheFuture.character
  )
end

2.times do |_index|
  Task.create(
    name: Faker::Movies::PrincessBride.character
  )
end

2.times do |_index|
  Status.create(
    name: Faker::Movies::PrincessBride.character
  )
end
