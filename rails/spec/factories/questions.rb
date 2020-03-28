# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :question do
    text { Faker::Lorem.question }
  end
end
