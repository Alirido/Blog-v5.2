class Renametable < ActiveRecord::Migration[5.2]
  def change
  	rename_table :role, :roles
  end
end
