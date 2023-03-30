class AddStatusToInsights < ActiveRecord::Migration[7.0]
  def change
    add_column :insights, :status, :string
  end
end
