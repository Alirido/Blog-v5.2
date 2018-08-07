class AddRolesRefToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :roles, foreign_key: true
  end
end
