class Answer < ApplicationRecord
  belongs_to :goal
  belongs_to :template_question
  has_many :comments
  has_many :highlights

  validates :content, presence: true
end
