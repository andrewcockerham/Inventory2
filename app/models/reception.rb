class Reception < ActiveRecord::Base
	### Join table between PurchasOrder and Suppliers???? ####
	## not a join table?


	# Validations
	validates_presence_of :purchase_order_id

	# Associations
	belongs_to :purchase_order #, dependent: :destroy
	# has_one :purchase_order #, dependent: :destroy # maybe this should be 'belongs_to'
	# has_one :supplier ## maybe don't need this b/c can find through PO?
	belongs_to :item
end
