class AddItemIdToReceptions < ActiveRecord::Migration
  def change
  	add_column :receptions, :item_id, :integer
  	add_index :receptions, :item_id
  end
end
