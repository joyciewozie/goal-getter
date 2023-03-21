class Goal < ApplicationRecord
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :highlights, dependent: :destroy
end
