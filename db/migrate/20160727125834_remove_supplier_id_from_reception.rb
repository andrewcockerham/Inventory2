class RemoveSupplierIdFromReception < ActiveRecord::Migration
  def change
  	remove_column :receptions, :supplier_id
  end
end
