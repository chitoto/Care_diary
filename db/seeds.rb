Group.destroy_all
User.destroy_all
Pet.destroy_all
Wrap.destroy_all

20.times do |n|
  icon = Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
  user = User.create!(
    name: "seeduser#{n + 1}",
    email: "seed#{n + 1}@test.com",
    password: '123456',password_confirmation: '123456',
    admin: rand(2).zero?,
    icon: icon,
    )

  2.times do |i|
    group = user.groups.create!(
      name: "#{user.name}group#{i + 1}",
      owner_id: user.id,
      icon:File.open("./app/assets/images/icon.png"),
      )
      3.times do |s|
        icon = Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
        group_user = User.create!(
          name: "#{group.name}Assignuser#{s + 1}",
          email: "#{group.name}Assign#{s + 1}@test.com",
          password: '123456',password_confirmation: '123456',
          admin: rand(2).zero?,
          icon: icon,
          )
          group.members << group_user
        end
        5.times do |a|
          name = Faker::Creature::Dog.name
          birthday = Faker::Date.between(from: '2000/01/01', to: '2019/12/31')
          species = Faker::Creature::Dog.breed
          pet = group.pets.create!(
            name: name,
            birthday: birthday,
            gender: rand(1..3),
            species: species,
            memo: "#{a + 1}#{name}は#{species}です",
            icon:File.open("./app/assets/images/icon.png"),
            )
        end
    end

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
