class RenameQtyToStartingQty < ActiveRecord::Migration
  def change
  	rename_column :my_builds, :qty, :start_qty
  end
end
