class RemoveReceptionIdFromPurchaseOrders < ActiveRecord::Migration
  def change
  	remove_column :purchase_orders, :reception_id
  end
end
