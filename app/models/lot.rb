class Lot < ActiveRecord::Base

	# Validations
	validates_presence_of :number, :item_id
	validates_uniqueness_of :number

	# Associations
	belongs_to :item
	belongs_to :reception

	accepts_nested_attributes_for :item
end
