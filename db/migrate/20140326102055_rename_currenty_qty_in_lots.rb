class RenameCurrentyQtyInLots < ActiveRecord::Migration
  def change
  	rename_column :lots, :current_qty, :inventory_qty
  end
end
