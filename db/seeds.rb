# frozen_string_literal: true

require 'faker'

chef = Chef.create(name: 'Leroy',
                   email: 'leroy@chef.com',
                   password: 'password1234',
                   password_confirmation: 'password1234')
Recipe.create(name: 'Cookies Shake',
              description: 'Cookies & Cream Shake',
              chef: chef)
Recipe.create(name: 'Hamburger',
              description: 'Angus Beef with Lettuce & Tomato',
              chef: chef)

20.times do
  name = Faker::Name.name
  email = Faker::Internet.email(name)
  pass = Faker::Internet.password
  Chef.create(name: name,
              email: email,
              password: pass,
              password_confirmation: pass)
end

chefs = Chef.all

35.times do
  name = Faker::Food.dish
  description = Faker::Food.description
  Recipe.create(name: name, description: description, chef: chefs.sample)
end
