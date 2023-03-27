class Comment < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  has_one :insight, through: :answer

  validates :content, presence: true
end
