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

class Creature < ApplicationRecord
end
