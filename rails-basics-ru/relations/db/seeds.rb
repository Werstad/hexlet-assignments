# frozen_string_literal: true

require 'faker'

2.times do |_i|
  User.create(
    name: Faker::Name.first_name
  )
end

statuses_name = %w[New In Progres Done]

statuses_name.each do |status|
  Status.create(
    name: status
  )
end

users = User.all
statuses = Status.all

5.times do |_i|
  Task.create(
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    user: users.sample,
    status: statuses.sample
  )
end
