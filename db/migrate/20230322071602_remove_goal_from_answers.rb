class RemoveGoalFromAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :goal_id, foreign_key: true
  end
end
