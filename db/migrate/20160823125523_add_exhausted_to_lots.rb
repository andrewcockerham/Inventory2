class AddExhaustedToLots < ActiveRecord::Migration
  def change
    add_column :lots, :exhausted, :boolean
  end
end
