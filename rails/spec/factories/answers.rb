FactoryBot.define do
  factory :answer do
    user
    question
    text { Faker::Lorem.paragraph }
  end
end