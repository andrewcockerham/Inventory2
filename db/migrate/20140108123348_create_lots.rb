class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.integer :number
      t.integer :initial_qty
      t.integer :current_qty
      t.integer :item_id
      t.boolean :cleaned

      t.timestamps
    end
  end
end
