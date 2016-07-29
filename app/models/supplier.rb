class Supplier < ActiveRecord::Base

	# Associations
	# has_many :orders, dependent: :destroy
	# has_many :purchase_orders, :through => :orders
	has_many :purchase_orders

	# has_many :parts, dependent: :destroy
	# has_many :items #, :through => :parts # don't need parts
	has_and_belongs_to_many :items

	# belongs_to :reception
end
