class AddNcmrToLots < ActiveRecord::Migration
  def change
    add_column :lots, :ncmr, :boolean
  end
end
