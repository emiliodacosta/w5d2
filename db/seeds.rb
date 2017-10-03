# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create!(username: "user1", password: "password1")
u2 = User.create!(username: "user2", password: "password2")
u3 = User.create!(username: "user3", password: "password3")

s1 = Sub.create!(title: "Cars", description: "vroom vroom", moderator_id: u1.id)
s2 = Sub.create!(title: "Parrots", description: "kaw kaw", moderator_id: u2.id)

p1 = Post.create!(title: "Awesome Cars",
  url: "http://kbb.com",
  content: "This site helps you buy cars smartly with smartness.",
  sub_id: s1.id,
  author_id: u1.id
)

p2 = Post.create!(title: "Cars are Lame",
  url: "http://planetearth.com",
  content: "Trees > Cars",
  sub_id: s1.id,
  author_id: u2.id
)

p3 = Post.create!(title: "Why do Parrots Talk",
  url: "http://about.com",
  content: "I don't know why they do it but how come",
  sub_id: s2.id,
  author_id: u2.id
)

p4 = Post.create!(title: "Who cares about parrots. Get a car bro.",
  url: "http://ford.com",
  content: "Built ford tough. Sucka.",
  sub_id: s2.id,
  author_id: u1.id
)

p5 = Post.create!(title: "It's getting hostile in here guys. Let's chill out and eat parrots in cars.",
  url: "http://compromise.com",
  content: "Let's all be friendsss except the parrotfood",
  sub_id: s2.id,
  author_id: u3.id
)
  
