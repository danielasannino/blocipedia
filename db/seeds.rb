require 'faker'

User.destroy_all

# Create Users
10.times do

  user = User.new(
      name:      Faker::Name.name,
      email:     Faker::Internet.email,
      password: 'password'
      )
    user.skip_confirmation!
    user.save!
end



# Create an admin user
admin = User.new(
  name:       'Admin User',
  email:      'admin@test.com',
  password:   'password',
  role:       'admin'
)
admin.skip_confirmation!
admin.save!

# Create a premium user
premium = User.new(
  name:       'Premium User',
  email:      'premium@test.com',
  password:   'password',
  role:       'premium',
)
premium.skip_confirmation!
premium.save!

# Create member user
member = User.new(
  name:     'Member User',
  email:    'member@test.com',
  password: 'password',
)
member.skip_confirmation!
member.save!

users = User.all

puts "#{User.count} users created."

# Create Wikis
users.each do |user|
    5.times do
    user.wikis.create!(
      title:    Faker::Lorem.word,
      body:     Faker::Lorem.paragraph,
      private:  false
    )
  end
end

Wikis = Wiki.all

puts "#{Wiki.count} posts created"

puts "Seed finished"
