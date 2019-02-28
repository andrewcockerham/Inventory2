class PurchaseOrder < ActiveRecord::Base

	# Validations
	validates_uniqueness_of :purchase_order_number, :message => "has already been taken. Please click 'back' then 'New Purchase Order' again"
	validates_presence_of 	:purchase_order_number, :cost
	# validates_presence_of 	:purchase_order_number, :supplier #or suppliers?

	# Associations
	has_many :quantities, dependent: :destroy
	has_many :items, :through => :quantities
	#?
	has_many :lots # don't need this?

	# has_many :orders, dependent: :destroy # maybe not needed at all???
	# has_many :suppliers, :through => :orders #, :source => :supplier_id

	belongs_to :supplier
	has_many :receptions ## FIX THIS ASSOCIATION IN THE DATABASE???
	# belongs_to :reception #should be 'has_many'?

	accepts_nested_attributes_for :quantities, :reject_if => :all_blank, allow_destroy: true
	accepts_nested_attributes_for :items

	accepts_nested_attributes_for :supplier
end