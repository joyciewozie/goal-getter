class AddInsightToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :insight, foreign_key: true
  end
end
