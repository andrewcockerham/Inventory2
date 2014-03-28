class AddCompleteToMyBuilds < ActiveRecord::Migration
  def change
    add_column :my_builds, :complete, :boolean
    add_index :my_builds, :complete
  end
end
