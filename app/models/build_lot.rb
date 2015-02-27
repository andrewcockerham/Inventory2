class BuildLot < ActiveRecord::Base
	### Join table for :lots and :my_builds

	# Associations
	belongs_to :lot
	belongs_to :my_build
end
