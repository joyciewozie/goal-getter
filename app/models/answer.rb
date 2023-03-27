class Answer < ApplicationRecord
  belongs_to :template_question
  belongs_to :insight
  has_one :goal, through: :insight
  has_many :comments, dependent: :destroy

  validates :content, presence: true

  def highlighted_content
    highlighted = content
    highlights.each do |highlight|
      highlighted = content.gsub(highlight.text, '<span class="underline">' + highlight.text + '</span>')
    end
    highlighted
  end
end
