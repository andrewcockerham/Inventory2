class ChangePurchaseOrderStatusFromStringToBoolean < ActiveRecord::Migration
	def up
	  change_column :purchase_orders, :status, :boolean
	end

	def down
	  change_column :purchase_orders, :status, :string
	end
end
