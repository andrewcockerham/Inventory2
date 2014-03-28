class Reception < ActiveRecord::Base

	# Associations
	has_one :purchase_order #, dependent: :destroy
	has_one :supplier
end
