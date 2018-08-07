class RenameOldColumntToNewColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :roles_id, :role_id
  end
end
