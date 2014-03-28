class AddPurchaseOrderIdToLots < ActiveRecord::Migration
  def change
    add_column :lots, :purchase_order_id, :integer
    add_index :lots, :purchase_order_id
  end
end
