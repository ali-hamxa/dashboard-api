# frozen_string_literal: true

require 'faker'

continents = ['Africa', 'Antarctica', 'Asia', 'Europe', 'North America', 'Oceania', 'South America']

30.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    continent: continents.sample,
    country: Faker::Address.country,
    state: Faker::Address.state,
    city: Faker::Address.city
  )
end
