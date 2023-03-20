class CreateHighlights < ActiveRecord::Migration[7.0]
  def change
    create_table :highlights do |t|
      t.text :text, null: false
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
