class ChangeReceptionsDateFromDateToDatetime < ActiveRecord::Migration
  def up
	  change_column :receptions, :date, :datetime
	end

	def down
	  change_column :receptions, :date, :date
	end
end
