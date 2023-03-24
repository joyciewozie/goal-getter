class Insight < ApplicationRecord
  belongs_to :goal
  has_many :answers, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :summary, presence: true
end
