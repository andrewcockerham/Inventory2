class AddReceivedToQuantity < ActiveRecord::Migration
  def change
    add_column :quantities, :count_received, :integer
    add_index :quantities, :count_received
    add_column :quantities, :count_remaining, :integer
    add_index :quantities, :count_remaining
  end
end
