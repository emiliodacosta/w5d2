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
