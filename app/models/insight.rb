class Insight < ApplicationRecord
  belongs_to :goal
  has_many: answers
end
