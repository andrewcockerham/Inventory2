class RenameInitialQtyInLots < ActiveRecord::Migration
  def change
  	rename_column :lots, :initial_qty, :received_qty
  end
end