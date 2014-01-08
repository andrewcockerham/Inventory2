class PurchaseOrder < ActiveRecord::Base

	# Validations
	validates_uniqueness_of :purchase_order_number, :message => "has already been taken. Please click 'back' then New Purchase Order again"
	validates_presence_of 	:purchase_order_number, :cost

	# Associations
	has_many :quantities, dependent: :destroy
	has_many :items, :through => :quantities

	has_many :orders, dependent: :destroy # maybe not needed at all???
	has_many :suppliers, :through => :orders #, :source => :supplier_id

	accepts_nested_attributes_for :quantities, 
											:reject_if => :all_blank,
											:allow_destroy => true
	accepts_nested_attributes_for :suppliers
end