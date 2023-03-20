class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :gender, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :age, :integer, null: false
  end
end
