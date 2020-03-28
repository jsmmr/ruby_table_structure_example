# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :friends
  has_many :friend_users, through: :friends, class_name: 'User'
  has_many :answers
  has_many :pets
end
