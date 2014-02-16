class AddApprovedAndCriticalToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :approved, :boolean
    add_column :suppliers, :critical, :boolean
  end
end
