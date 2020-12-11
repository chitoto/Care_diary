20.times do |n|
  name = Faker::Creature::Dog.name
  birthday = Faker::Date.between(from: '2000/01/01', to: '2019/12/31')
  species = Faker::Creature::Dog.breed
  Pet.create!(name: name,
               birthday: birthday,
               gender: rand(1..3),
               species: species,
               memo: "#{name}は#{species}です",
               icon:File.open("./app/assets/images/icon.png"),
               )
end
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
