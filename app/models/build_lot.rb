class BuildLot < ActiveRecord::Base

	# Associations
	belongs_to :lot
	belongs_to :my_build
end
