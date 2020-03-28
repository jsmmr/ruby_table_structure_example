# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  has_many :answers
end
