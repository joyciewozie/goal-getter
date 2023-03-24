class AddStatusToCollaborators < ActiveRecord::Migration[7.0]
  def change
    add_column :collaborators, :accepted, :boolean, default: false, null: false
  end
end
