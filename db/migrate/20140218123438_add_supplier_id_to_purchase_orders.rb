class AddSupplierIdToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :supplier_id, :integer
	  add_index :purchase_orders, :supplier_id
  end
end
