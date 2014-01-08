class Part < ActiveRecord::Base
	#### This is a join model for Items and Suppliers ####

	# Validations
	validates_presence_of :supplier_id

	# Associations
	belongs_to :item
	belongs_to :supplier

	accepts_nested_attributes_for :supplier
end
