class CreateBuildLots < ActiveRecord::Migration
  def change
    create_table :build_lots do |t|
      t.integer :my_build_id
      t.integer :lot_id
      t.integer :pull_quantity

      t.timestamps
    end
    add_index :build_lots, :my_build_id
    add_index :build_lots, :lot_id
  end
end
