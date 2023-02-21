require 'faker'

# Création de 10 utilisateurs
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: "#{first_name} #{last_name}", domain: 'yopmail.com')
  password = "password"
  User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
  
end

10.times do
    Event.create!(
      start_date: Time.now + rand(1..30).days,
      duration: rand(1..6) * 5,
      title: Faker::Lorem.sentence(word_count: rand(3..10)),
      description: Faker::Lorem.paragraph_by_chars(number: rand(20..1000)),
      price: rand(1..1000),
      location: Faker::Address.full_address,
      admin_id: rand(1..10)
    )
  end

  10.times do
    user = User.all.sample
    event = Event.all.sample
    Attendance.create!(user: user, event: event, stripe_customer_id: Faker::Alphanumeric.alphanumeric(number: 10))
  end