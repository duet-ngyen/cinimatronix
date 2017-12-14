100.times {
  u = User.new
  u.name = Faker::Name.name
  u.email = Faker::Internet.email
  u.save!
}
