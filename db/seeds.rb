require 'random_data'
# Create Users
5.times do
  User.create!(
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

# Create admin user
unless User.find_by(email: 'admin@test.com')
  User.create!(
    email: 'admin@test.com',
    password: 'password',
  )
end

unless User.find_by(email: 'member@test.com')
  User.create!(
    email: 'member@test.com',
    password: 'password'
  )
end
users = User.all

puts "#{User.count} users created"

# Create Wikis
10.times do
  Wiki.create!(
    user: users.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end

wikis = Wiki.all

puts "#{Wiki.count} posts created"

puts "Seed finished" 
