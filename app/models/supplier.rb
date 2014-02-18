class Supplier < ActiveRecord::Base

	# Associations
	# has_many :orders, dependent: :destroy
	# has_many :purchase_orders, :through => :orders
	has_many :purchase_orders

	has_many :parts, dependent: :destroy
	has_many :items, :through => :parts
end
