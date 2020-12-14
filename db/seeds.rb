
# User.destroy_all
# 20.times do |n|
#   user = User.create!(
#     name: "seeduser#{n + 1}",
#     email: "seed#{n + 1}@test.com",
#     password: '123456',password_confirmation: '123456',
#     admin: rand(2).zero?,
#     icon:File.open("./app/assets/images/icon.png"),
#     )
#
#     name = Faker::Creature::Dog.name
#     birthday = Faker::Date.between(from: '2000/01/01', to: '2019/12/31')
#     species = Faker::Creature::Dog.breed
#     user.pets.create!(
#       name: name,
#       birthday: birthday,
#       gender: rand(1..3),
#       species: species,
#       memo: "#{n + 1}#{name}は#{species}です",
#       icon:File.open("./app/assets/images/icon.png"),
#       )
#
# end

# 20.times do |n|
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   password = "123456"
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                )
# end
