# == Schema Information
#
# Table name: friends
#
#  id             :bigint           not null, primary key
#  user_id        :bigint           not null
#  friend_user_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :friend do
    
  end
end
