class Lot < ActiveRecord::Base

	# Validations
	validates_presence_of :number, :item_id

	# Associations
	belongs_to :item

	accepts_nested_attributes_for :item
end
