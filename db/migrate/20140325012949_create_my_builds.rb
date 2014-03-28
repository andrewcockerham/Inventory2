class CreateMyBuilds < ActiveRecord::Migration
  def change
    create_table :my_builds do |t|
      t.integer :qty
      t.integer :scrap_qty
      t.string :description
      t.date :start_date
      t.date :ship_date

      t.timestamps
    end
    add_index :my_builds, :qty
    add_index :my_builds, :scrap_qty
  end
end
