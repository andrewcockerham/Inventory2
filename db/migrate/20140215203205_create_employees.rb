class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      # t.string :email

      t.timestamps
    end
    add_index :employees, :first_name
    add_index :employees, :last_name
    # add_index :employees, :email
  end
end
