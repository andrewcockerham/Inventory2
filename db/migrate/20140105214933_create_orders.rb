class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :purchase_order_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end
