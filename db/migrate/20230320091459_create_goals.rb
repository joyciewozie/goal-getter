class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :goal_type, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.string :status, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
