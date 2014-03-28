class AddAcceptedQtyToLots < ActiveRecord::Migration
  def change
    add_column :lots, :accepted_qty, :integer
    add_index :lots, :accepted_qty
  end
end
