class Highlight < ApplicationRecord
  belongs_to :answer
  has_one :goal, through: :answer

  validates :text, presence: true
end
