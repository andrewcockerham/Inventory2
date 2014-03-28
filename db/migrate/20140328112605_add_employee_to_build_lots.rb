class AddEmployeeToBuildLots < ActiveRecord::Migration
  def change
    add_column :build_lots, :employee_id, :integer
  end
end
