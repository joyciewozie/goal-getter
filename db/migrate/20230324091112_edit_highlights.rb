class EditHighlights < ActiveRecord::Migration[7.0]
  def change
    remove_reference :highlights, :answer, null: false, foreign_key: true
    add_reference :highlights, :goal, null: false, foreign_key: true
  end
end
