class AddStatusToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :status, :string

    add_index :purchase_orders, :status
  end
end
