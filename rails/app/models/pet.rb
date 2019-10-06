# == Schema Information
#
# Table name: pets
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  creature_id :integer          not null
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Pet < ApplicationRecord
  belongs_to :creature
  belongs_to :user
end
