class MyBuild < ActiveRecord::Base

	# Associations
	has_many :build_lots, dependent: :destroy
	has_many :lots, through: :build_lots
end
