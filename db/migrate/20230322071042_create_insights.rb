class CreateInsights < ActiveRecord::Migration[7.0]
  def change
    create_table :insights do |t|
      t.string :name, null: false
      t.text :summary, null: false
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
