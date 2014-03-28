class AddRejectedQtyToLots < ActiveRecord::Migration
  def change
    add_column :lots, :rejected_qty, :integer
    add_index :lots, :rejected_qty
  end
end
