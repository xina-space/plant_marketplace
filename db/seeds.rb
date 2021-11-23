# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "DESTROY DATA"
Plant.delete_all
User.delete_all
puts "CREATING DATA"

user1 = User.new(email: "Paulo@qualqer.com", password: "123456")
user1.save

user2 = User.new(email: "Mario@qualqer.com", password: "123456")
user2.save
user3 = User.new(email: "Kristina@qualqer.com", password: "123456")
user3.save
user4 = User.new(email: "Alexandro@qualqer.com", password: "123456")
user4.save
plant1 = Plant.new(species: "cactus", name: "Bob", description: "nice plant")
plant1.save
plant2 = Plant.new(species: "cactus", name: "Rita", description: "nice Rita")
plant2.save
plant3 = Plant.new(species: "fig tree", name: "tusk", description: "nice tusk")
plant3.save
