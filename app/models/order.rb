class Order < ActiveRecord::Base
	#### This is a join model for PurchaseOrders and Suppliers ####

	# Associations
	belongs_to :supplier
	belongs_to :purchase_order

	accepts_nested_attributes_for :supplier
end
