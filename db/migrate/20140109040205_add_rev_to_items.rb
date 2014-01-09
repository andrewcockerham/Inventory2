class AddRevToItems < ActiveRecord::Migration
  def change
    add_column :items, :revision, :string
  end
end
