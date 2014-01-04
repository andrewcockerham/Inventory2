class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.date :date
      t.integer :purchase_order_number
      t.decimal :cost
      t.string	:description

      t.timestamps
    end
  end
end
