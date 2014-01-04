class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :part_number
      t.string :name
      t.integer :on_order_qty
      t.integer :in_inspection_qty
      t.integer :stock_qty
      t.integer :ncmr_qty
      t.string :name_and_number

      t.timestamps
    end
  end
end
