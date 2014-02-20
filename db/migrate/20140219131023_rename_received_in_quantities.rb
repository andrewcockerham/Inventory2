class RenameReceivedInQuantities < ActiveRecord::Migration
  def change
  	rename_column :quantities, :count_received, :amount_received
  	rename_column :quantities, :count_remaining, :amount_remaining
  end
end
