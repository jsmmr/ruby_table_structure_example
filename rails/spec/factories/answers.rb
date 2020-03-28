# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  question_id :bigint           not null
#  text        :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :answer do
    user
    question
    text { Faker::Lorem.paragraph }
  end
end
