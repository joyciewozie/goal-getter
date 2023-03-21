class Goal < ApplicationRecord
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :highlights, dependent: :destroy

  validates :goal_type, :name, :description, :status, presence: true
end
