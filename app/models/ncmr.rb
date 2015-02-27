class Ncmr < ActiveRecord::Base

	# Validations
	validates_uniqueness_of :number

	# Associations
	has_many :defeciencies
	has_many :lots, through: :defeciencies
end
