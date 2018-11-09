FactoryBot.define do
  factory :notification do
    name { Faker::FunnyName.name }
    email { Faker::Internet.email }
  end
end
