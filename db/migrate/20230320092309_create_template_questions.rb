class CreateTemplateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :template_questions do |t|
      t.text :title, null: false
      t.string :goal_type, null: false

      t.timestamps
    end
  end
end
