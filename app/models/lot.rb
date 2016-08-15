class Lot < ActiveRecord::Base

	# Validations
	validates_presence_of :number, :item_id
	validates_uniqueness_of :number
	# validates :inventory_qty, :numericality => { greater_than_or_equal_to: 0, message: "Inventory can't be negative" }# (message isnt working)
	#, :less_than_or_equal_to => :max_age }
	# validates :height, :inclusion => { :in => 1..3000, :message => "The height must be between 1 and 3000" }

	# Associations
	belongs_to :item
	belongs_to :reception
	# ?
	belongs_to :purchase_order
	# for join table 'build_lots'
	has_many :build_lots, dependent: :destroy
	has_many :my_builds, through: :build_lots
	belongs_to :my_builds
	# for join with NCMRs, join_table is :defeciency
	has_many :defeciencies
	has_many :ncmrs, through: :defeciencies


	accepts_nested_attributes_for :item
	accepts_nested_attributes_for :build_lots #, :reject_if => :all_blank, allow_destroy: true
end
