class Answer < ApplicationRecord
  belongs_to :goal
  belongs_to :template_question
  has_many :comments
end
