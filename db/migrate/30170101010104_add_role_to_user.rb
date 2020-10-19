class AddRoleToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :role, foreign_key: true
    change_column :users, :role_id, :integer, default: 1
  end
end
