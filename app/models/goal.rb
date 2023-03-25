class Goal < ApplicationRecord
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :highlights, dependent: :destroy
  has_many :insights, dependent: :destroy
  has_one_attached :photo

  validates :goal_type, :name, :description, :status, presence: true
end
