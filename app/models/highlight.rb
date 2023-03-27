class Highlight < ApplicationRecord
  belongs_to :goal
  belongs_to :answer

  validates :text, presence: true
end
