class Lot < ActiveRecord::Base

	# Validations
	validates_presence_of :number, :item_id
	validates_uniqueness_of :number

	# Associations
	belongs_to :item
	belongs_to :reception
	# ?
	belongs_to :purchase_order
	# for join table 'build_lots'
	has_many :build_lots, dependent: :destroy
	has_many :my_builds, :through => :build_lots
	belongs_to :my_builds


	accepts_nested_attributes_for :item
	accepts_nested_attributes_for :build_lots #, :reject_if => :all_blank, allow_destroy: true

end
