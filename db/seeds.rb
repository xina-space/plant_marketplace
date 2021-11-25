# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "DESTROY DATA"
Booking.delete_all
Plant.delete_all
User.delete_all
puts "CREATING DATA"

user1 = User.new(email: "paulo@qualqer.com", password: "123456")
user1.save

user2 = User.new(email: "mario@qualqer.com", password: "123456")
user2.save
user3 = User.new(email: "kristina@qualqer.com", password: "123456")
user3.save
user4 = User.new(email: "alexandro@qualqer.com", password: "123456")
user4.save
plant1 = Plant.new(species: "Aloe Vera", name: "Cindy", address: "1600 Pennsylvania Avenue NW Washington, D.C. 20500 U.S.", description: "From curing heartburn to sunburn, you'll want to have cindy around. She's tought on the outside, soft on the inside and just makes a trustworthy companion to weather life's most unexpected outcomes", user_id: user1.id)
file = URI.open('https://www.kendallsflorist.co.uk/wp-content/uploads/2016/01/Aloe-Vera-Plant-1.jpg')
plant1.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
plant1.save
plant2 = Plant.new(species: "Monstera", name: "Rita", address: "55 Rue du Faubourg Saint-Honoré, 75008 Paris, France", description: "Rita is about bringing the rainforest to you, not you to the rainforest. She's about abundance, joy and splendor. She's truly a breath of fresh air.", user_id: user1.id)
file = URI.open('https://urbanjungle.pt/wp-content/uploads/2020/02/Monstera-deliciosa-XL.jpg')
plant2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
plant2.save
plant3 = Plant.new(species: "Dracaena", name: "Tusk", address: "Bundesplatz 3, 3003 Bern, Switzerland", description: "He might come from the most neutral country in the world but rest asured, Tusk has character and will play a vital role in the outcome of your day.", user_id: user1.id)
file = URI.open('https://cdn.thecolvinco.com/photos_cache_thumb/xl-drake/xl-drake-6980797f-7b94-4b35-9820-3adebb3f046e.jpg')
plant3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
plant3.save
plant4 = Plant.new(species: "Yucca", name: "Mona", address: "1 Sheikh Mohammed bin Rashid Blvd - Downtown Dubai - Dubai - United Arab Emirates", description: "She comes from the Desert. She's tought as nails. She was also seen on The Good, the Bad and the Ugly", user_id: user1.id)
file = URI.open('https://tpn-1.s3.eu-west-2.amazonaws.com/media/217/217-Page38-anca-gabriela-zosin-f3e9p4-lqRw-unsplash.jpeg')
plant4.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
plant4.save
plant5 = Plant.new(species: "Ficus", name: "Bruce", address: "4 Jingshan Front St, Dongcheng, Beijing Shi, China, 100886", description: "Don't let his looks decieve you. Bruce is a ninja. Adapts to any corner, lounge, bathroom and bedroom. His moto: Be water my friend", user_id: user1.id)
file = URI.open('https://bloomscape.com/wp-content/uploads/2020/05/bloomscape_ficus-altissima-std_charcoal.jpg')
plant5.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
plant5.save

puts "#{Plant.count} plants created"
