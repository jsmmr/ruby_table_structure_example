FactoryBot.define do
  factory :creature do
    name { Faker::Creature::Animal.name }
    emoji { Faker::Lorem.multibyte }
  end
end