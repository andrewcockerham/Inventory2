class AddDateCleanedToLots < ActiveRecord::Migration
  def change
    add_column :lots, :date_cleaned, :date
    add_index :lots, :date_cleaned
  end
end
