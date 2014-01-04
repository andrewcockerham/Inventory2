class PurchaseOrder < ActiveRecord::Base

	# Associations
	has_many :quantities, dependent: :destroy
	has_many :items, :through => :quantities

	accepts_nested_attributes_for :quantities, 
											:reject_if => :all_blank,
											:allow_destroy => true
end
