class Quantity < ActiveRecord::Base

	# Associations
	belongs_to :item
	belongs_to :purchase_order

	accepts_nested_attributes_for :item
end
