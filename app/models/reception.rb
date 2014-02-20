class Reception < ActiveRecord::Base

	# Associations
	has_one :purchase_order
	has_one :lot
	has_one :supplier
end
