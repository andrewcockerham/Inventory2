class AddCurrentToMyBuilds < ActiveRecord::Migration
  def change
    add_column :my_builds, :current, :boolean
    add_index :my_builds, :current
  end
end
