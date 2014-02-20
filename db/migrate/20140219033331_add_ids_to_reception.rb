class AddIdsToReception < ActiveRecord::Migration
  def change
    add_column :receptions, :purchase_order_id, :integer
    add_column :receptions, :supplier_id, :integer
    add_column :receptions, :lot_id, :integer
  end
end
