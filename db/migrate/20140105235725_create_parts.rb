class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :item_id
      t.integer :supplier_id

      t.timestamps
    end
    add_index :parts, :item_id
    add_index :parts, :supplier_id
  end
end
