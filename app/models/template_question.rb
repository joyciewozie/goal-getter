class TemplateQuestion < ApplicationRecord
  has_many :answers

  validates :goal_type, :title, presence: true
end
