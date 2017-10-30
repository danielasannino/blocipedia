FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      name "Test User"
      "person#{n}@example.com"
    end
    password "password"
  end
end
