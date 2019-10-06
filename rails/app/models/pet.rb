class Pet < ApplicationRecord
  belongs_to :creature
  belongs_to :user
end
