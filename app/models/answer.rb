class Answer < ApplicationRecord
  belongs_to :template_question
  belongs_to :insight
  has_one :goal, through: :insight
  has_many :comments, dependent: :destroy

  validates :content, presence: true
end
