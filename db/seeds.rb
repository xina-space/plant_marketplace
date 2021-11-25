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
plant1 = Plant.new(species: "cactus", name: "Bob", description: "nice plant", user_id: user1.id, address: "Lisboa")
file = URI.open('https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.sensorytrust.org.uk%2Fuploads%2Fimages%2Fgarden-flowers-and-seating.jpg&f=1&nofb=1')
plant1.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
plant1.save
plant2 = Plant.new(species: "cactus", name: "Rita", description: "nice Rita", user_id: user1.id, address: "Porto")
file = URI.open('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Flifezshining.com%2Fwp-content%2Fuploads%2F2020%2F12%2Fimage-9.jpg&f=1&nofb=1')
plant2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
plant2.save
plant3 = Plant.new(species: "fig tree", name: "tusk", description: "nice tusk", user_id: user1.id, address: "Coimbra")
file = URI.open('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.shopify.com%2Fs%2Ffiles%2F1%2F0260%2F3037%2F4957%2Fproducts%2Fsignature-white-pots-with-plants_eae028fd-0436-4e54-8243-ad4f5e4e2627_1200x1200.jpg%3Fv%3D1573582351&f=1&nofb=1')
plant3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
plant3.save
