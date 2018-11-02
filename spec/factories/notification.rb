FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :notification do
    name "Test notification user"
    email
  end
end