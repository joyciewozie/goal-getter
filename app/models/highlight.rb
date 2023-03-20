class Highlight < ApplicationRecord
  belongs_to :answer
  has_one :goal, through: :answer
end
