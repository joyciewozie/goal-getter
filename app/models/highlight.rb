class Highlight < ApplicationRecord
  belongs_to :goal

  validates :text, presence: true
end
