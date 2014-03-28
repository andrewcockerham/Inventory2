class AddReceivedDateToLots < ActiveRecord::Migration
  def change
    add_column :lots, :received_date, :Date
    add_index :lots, :received_date
  end
end
