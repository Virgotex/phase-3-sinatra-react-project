require 'faker'

puts "🌱 Seeding spices..."

100.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )

  category = Category.create(name: Faker::Lorem.word)

  organiser = Organiser.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )

  event = Event.new(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    date: Faker::Date.between(from: Date.today, to: Date.today + 7),
    time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 7, format: :default),
    location: Faker::Address.full_address,
    category: category,
    organiser: organiser
  )
  event.save

  registration = Registration.create(
    event: event,
    user: user,
    status: Faker::Lorem.word
  )
end

puts "✅ Done seeding!"
