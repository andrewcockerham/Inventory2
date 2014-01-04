class Item < ActiveRecord::Base

	# Associations
	has_many :quantities #, dependent: :destroy
	has_many :purchase_orders, :through => :quantities
end
