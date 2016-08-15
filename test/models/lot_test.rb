require 'test_helper'

class LotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "something" do
  	# @lot = lots(:lot_one)
  	# p @lot
  	# @po = purchase_orders(:purchase_order_one)
  	# @po = @lot.purchase_order
  	# p @po
	end

  test "when receive a lot, PO Quantity Received increases by lot.received_qty" do
  	# TODO: FINISH THIS TEST
  	RECEIVED_QTY = 100;
  	PURCHASE_ORDER_NUMBER = '20160814-01'
  	po = PurchaseOrder.create(cost: 100, date: Date.today, purchase_order_number: PURCHASE_ORDER_NUMBER, description: 'test',
  														estimated_arrival: Date.tomorrow, supplier_id: Supplier.last.id, status: false)
  	p po
  	po.quantities.build
  	po.quantities.each do |q|
  		q.item_id = Item.last.id ## how to generalize this for a PO with multiple items
  		# FIX: but in line above, item_id doesn't match po.quantities.item_id
  		q.save
  	end
  	# binding.pry
    lot = Lot.create(cleaned: false, inventory_qty: 0, received_qty: RECEIVED_QTY,
                           item_id: Item.first.id, number: 500, purchase_order_id: po.id,
                           status: 'inspection', received_date: Date.today, accepted_qty: nil,
                           rejected_qty: 0, date_cleaned: Date.today, ncmr: false,
                           full_po_qty: true)

    assert lot.valid?, 'The lot was not valid when all parameters were supplied'
    binding.pry
    assert_equal lot.received_qty, po.quantities.first.amount_received, 'Lot received_qty != po.amount_received'

    # @lot.purchase_order.quantities.first.amount_received
    # assert_equal 'Post title', post.title, 'Post title does not match'
  end

  # test "Post doesn't save without all parameters" do
  #   post = Post.create(title: 'Post title')
  #   assert_not post.valid?, 'The post should not be valid when missing body'
  # end
end


# FIX TEST - somehow lot.item_id is not the same item_id that is in the "quantity" of the po....
