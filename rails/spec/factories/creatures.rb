# == Schema Information
#
# Table name: creatures
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  emoji      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :creature do
    name { Faker::Creature::Animal.name }
    emoji { Faker::Lorem.multibyte }
  end
end
