class Insight < ApplicationRecord
  belongs_to :goal
  has_many :answers
  has_one_attached :photo
end
