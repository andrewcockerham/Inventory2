class Quantity < ActiveRecord::Base
	### This is a join table between Items and PurchaseOrders ###

	# Associations
	belongs_to :item
	belongs_to :purchase_order

	accepts_nested_attributes_for :item
end
