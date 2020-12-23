Group.destroy_all
User.destroy_all
Pet.destroy_all
Wrap.destroy_all

20.times do |n|
  a = rand(1..8)
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    icon: open("./app/assets/images/hito/hito#{a}.png"),
    password: '123456',password_confirmation: '123456',
    admin: rand(2).zero?,
    )

  2.times do |i|
    group = user.groups.create!(
      name: "#{user.name}group#{i + 1}",
      owner_id: user.id,
      )
      3.times do |s|
        c = rand(1..8)
        group_user = User.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          icon: open("./app/assets/images/hito/hito#{c}.png"),
          password: '123456',password_confirmation: '123456',
          admin: rand(2).zero?,
          )
          group.members << group_user
        end
        5.times do |a|
          b = rand(1..4)
          name = Faker::Creature::Dog.name
          birthday = Faker::Date.between(from: '2000/01/01', to: '2019/12/31')
          species = Faker::Creature::Dog.breed
          pet = group.pets.create!(
            name: name,
            birthday: birthday,
            gender: rand(1..3),
            species: species,
            icon: open("./app/assets/images/animal/animal#{b}.jpg"),
            memo: "#{a + 1}#{name}は#{species}です",
            )
        end
    end
end
1.times do |n|
  a = rand(1..8)
  user = User.create!(
    name: 'test_user',
    email: 'test@exam.com',
    icon: open("./app/assets/images/hito/hito5.png"),
    password: '123456',password_confirmation: '123456',
    admin: true,
    )

  2.times do |i|
    group = user.groups.create!(
      name: "#{user.name}group#{i + 1}",
      owner_id: user.id,
      )
      3.times do |s|
        c = rand(1..8)
        group_user = User.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          icon: open("./app/assets/images/hito/hito#{c}.png"),
          password: '123456',password_confirmation: '123456',
          admin: rand(2).zero?,
          )
          group.members << group_user
        end
        5.times do |a|
          b = rand(1..4)
          name = Faker::Creature::Dog.name
          birthday = Faker::Date.between(from: '2000/01/01', to: '2019/12/31')
          species = Faker::Creature::Dog.breed
          pet = group.pets.create!(
            name: Faker::Creature::Dog.name,
            birthday: birthday,
            gender: rand(1..3),
            species: species,
            icon: open("./app/assets/images/animal/animal#{b}.jpg"),
            memo: "#{a + 1}#{name}は#{species}です",
            )
        end
    end
end
