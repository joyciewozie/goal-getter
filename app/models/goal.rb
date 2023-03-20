class Goal < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :answers
  has_many :highlights
end
