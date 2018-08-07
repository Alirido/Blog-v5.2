class RenameRolesToRole < ActiveRecord::Migration[5.2]
  def change
  	rename_table :roles, :role
  end
end
