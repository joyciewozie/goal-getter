class AddAnswerToHighlights < ActiveRecord::Migration[7.0]
  def change
    add_reference :highlights, :answer, null: false, foreign_key: true
  end
end
