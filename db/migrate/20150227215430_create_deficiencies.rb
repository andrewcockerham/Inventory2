class CreateDeficiencies < ActiveRecord::Migration
  def change
    create_table :deficiencies do |t|
      t.integer :lot_id
      t.integer :ncmr_id

      t.timestamps
    end
    add_index :deficiencies, :lot_id
    add_index :deficiencies, :ncmr_id
  end
end
