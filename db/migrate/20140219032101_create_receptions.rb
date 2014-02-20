class CreateReceptions < ActiveRecord::Migration
  def change
    create_table :receptions do |t|
      t.date :date
      t.integer :quantity
      t.string :description

      t.timestamps
    end
    add_index :receptions, :date
  end
end
