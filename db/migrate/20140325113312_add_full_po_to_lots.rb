class AddFullPoToLots < ActiveRecord::Migration
  def change
    add_column :lots, :full_po_qty, :boolean
    add_index :lots, :full_po_qty
  end
end
