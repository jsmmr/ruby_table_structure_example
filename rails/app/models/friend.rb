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
class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friend_user, class_name: 'User'
end
