class Goal < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :answers
end
