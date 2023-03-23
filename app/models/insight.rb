class Insight < ApplicationRecord
  belongs_to :goal
  has_many :answers

  validates :name, presence: true
  validates :summary, presence: true
end
