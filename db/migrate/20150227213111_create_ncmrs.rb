class CreateNcmrs < ActiveRecord::Migration
  def change
    create_table :ncmrs do |t|
      t.string :number

      t.timestamps
    end
    add_index :ncmrs, :number, unique: true
  end
end
