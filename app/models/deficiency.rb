class Deficiency < ActiveRecord::Base
	## JOIN TABLE FOR "LOTS" AND "NCMRS"
	# Associations
	belongs_to :lot
	belongs_to :ncmr
end
