class RemoveAdminFromUser < ActiveRecord::Migration[5.2]
  def change
  	remove_column :user, :admin
  end
end
