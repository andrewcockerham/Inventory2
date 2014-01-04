class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
    	t.integer :purchase_order_id
    	t.integer :item_id
      t.integer :amount

      t.timestamps
    end
  end
end
