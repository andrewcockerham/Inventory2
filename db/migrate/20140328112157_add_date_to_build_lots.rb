class AddDateToBuildLots < ActiveRecord::Migration
  def change
    add_column :build_lots, :pull_date, :date
  end
end
