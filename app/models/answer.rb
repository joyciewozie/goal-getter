class Answer < ApplicationRecord
  belongs_to :goal
  belongs_to :template_question
end
