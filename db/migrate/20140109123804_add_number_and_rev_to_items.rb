class AddNumberAndRevToItems < ActiveRecord::Migration
  def change
    add_column :items, :number_and_rev, :string
  end
end
