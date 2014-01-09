class AddCurrentRevToItems < ActiveRecord::Migration
  def change
    add_column :items, :current_rev, :boolean
  end
end
