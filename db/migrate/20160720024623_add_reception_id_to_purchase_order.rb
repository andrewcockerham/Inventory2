class AddReceptionIdToPurchaseOrder < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :reception_id, :integer
    add_index :purchase_orders, :reception_id
  end
end
