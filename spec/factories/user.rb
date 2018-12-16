FactoryBot.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password "password123"
    username "beefbowl#{n}"
    email "#{n}_#{Faker::Internet.email}"
  end
end
  