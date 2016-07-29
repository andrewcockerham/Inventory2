class CreateItemsAndSuppliersJoinTable < ActiveRecord::Migration
	def change
		# create_table :assemblies do |t|
		# 	t.string :name
		# 	t.timestamps
		# end

		# create_table :parts do |t|
		# 	t.string :part_number
		# 	t.timestamps
		# end

		create_table :items_suppliers, id: false do |t|
			t.belongs_to :item, index: true
			t.belongs_to :supplier, index: true
		end
	end
end
