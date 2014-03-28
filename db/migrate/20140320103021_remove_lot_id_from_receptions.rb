class RemoveLotIdFromReceptions < ActiveRecord::Migration
  def change
    remove_column :receptions, :lot_id
  end
end
