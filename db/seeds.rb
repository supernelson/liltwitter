require 'faker'

30.times do
  User.create(
    name: Faker::Name.name,
    username: Faker::Team.creature,
    email: Faker::Internet.email,
    password: "123"
    )
end

30.times do
  Post.create(
    content: Faker::Lorem.word,
    user_id: rand(1..30)
    )
end

30.times do
  Relationship.create(
    follower_id: rand(1..30),
    followed_id: rand(1..30)
    )