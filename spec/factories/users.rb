FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    sequence :name do |n|
      "Test User#{n}"
    end
    password "password"
  end
end
