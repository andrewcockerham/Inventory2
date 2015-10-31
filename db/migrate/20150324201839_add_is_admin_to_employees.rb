class AddIsAdminToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :is_admin, :boolean
    add_index :employees, :is_admin
  end
end
