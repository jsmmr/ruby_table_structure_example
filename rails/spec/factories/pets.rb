FactoryBot.define do
  factory :pet do
    user
    creature
    name { Faker::FunnyName.name }
  end
end