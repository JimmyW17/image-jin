FactoryBot.define do
  sequence :email do |n|
    "#{n}_#{Faker::Internet.email}"
  end

  sequence :username do |n|
    "beefbowl#{n}"
  end

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { "password123" }
    username
    email
  end
end
