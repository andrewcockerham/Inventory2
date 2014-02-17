class AddArrivalDateToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :estimated_arrival, :date
    add_index :purchase_orders, :estimated_arrival
  end
end
