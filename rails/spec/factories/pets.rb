# == Schema Information
#
# Table name: pets
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  creature_id :bigint           not null
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :pet do
    user
    creature
    name { Faker::FunnyName.name }
  end
end
