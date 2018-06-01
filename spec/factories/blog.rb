FactoryBot.define do
  sequence :title do |n|
    "An example article #{n}"
  end

  factory :article do
    title 
    text  "Here is some static text"
  end
end
