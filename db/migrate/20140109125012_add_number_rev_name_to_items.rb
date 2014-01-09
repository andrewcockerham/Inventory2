class AddNumberRevNameToItems < ActiveRecord::Migration
  def change
    add_column :items, :number_rev_name, :string
  end
end
