require 'faker'

30.times do
 User.create(
   name: Faker::Name.name,
   username: Faker::Team.creature,
   password: "123"
   )
end

30.times do
 Post.create(
   content: Faker::Lorem.word,
   user_id: rand(1..30)
   )
end

30.times do |i|
 Relationship.create(
   follower_id: i+1 ,
   followed_id: 30-i
   )
end
