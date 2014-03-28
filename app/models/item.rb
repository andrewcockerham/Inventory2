class Item < ActiveRecord::Base

	# Validations
	validates_uniqueness_of :number_and_rev # :part_number
	validates_presence_of :name, :part_number

	# Associations
	has_many :quantities, dependent: :destroy  # don't need this?
	has_many :purchase_orders, :through => :quantities # don't need this?
	has_many :parts, dependent: :destroy
	has_many :suppliers, :through => :parts
	has_many :lots

	accepts_nested_attributes_for :parts

	belongs_to :quantities
	# Custom Functions
	# def self.create_name_and_number
	# 	@number = @item.part_number
	# 	@name = @item.name
	# 	@item.name_and_number = @number + " " + @name		
	# end
end
