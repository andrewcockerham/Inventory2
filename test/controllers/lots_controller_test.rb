require 'test_helper'

class LotsControllerTest < ActionController::TestCase
  # include from Devise
  include Devise::Test::ControllerHelpers

  setup do
    @lot = lots(:lot_one)
  end

##### Custom Tests
  test "when lot created, should add accepted_qty to inventory_qty" do
    # @lot.inventory_qty
  end

##### End Custom Tests

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lot" do
    assert_difference('Lot.count') do
      new_lot_number = @lot.number + 200
      post :create, lot: { cleaned: @lot.cleaned, inventory_qty: @lot.inventory_qty, received_qty: @lot.received_qty,
                           item_id: @lot.item_id, number: new_lot_number, purchase_order_id: @lot.purchase_order_id,
                           status: @lot.status, received_date: @lot.received_date, accepted_qty: @lot.accepted_qty,
                           rejected_qty: @lot.rejected_qty, date_cleaned: @lot.date_cleaned, ncmr: @lot.ncmr,
                           full_po_qty: true }
      # post :create, lot: { cleaned: @lot.cleaned, inventory_qty: @lot.inventory_qty, received_qty: @lot.received_qty,
      #                      item_id: @lot.item_id, number: new_lot_number, purchase_order_id: @lot.purchase_order_id,
      #                      status: @lot.status, received_date: @lot.received_date, accepted_qty: @lot.accepted_qty,
      #                      rejected_qty: @lot.rejected_qty, date_cleaned: @lot.date_cleaned, ncmr: @lot.ncmr,
      #                      full_po_qty: true, full_po_checkbox: {"full_po_qty"=>"1"} }
    end

    assert_redirected_to lot_path(assigns(:lot))
  end

  test "should show lot" do
    get :show, id: @lot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lot
    assert_response :success
  end

  test "should update lot" do
    patch :update, id: @lot, lot: { cleaned: @lot.cleaned, inventory_qty: @lot.inventory_qty, received_qty: @lot.received_qty, item_id: @lot.item_id, number: @lot.number, purchase_order_id: @lot.purchase_order_id }
    assert_redirected_to lot_path(assigns(:lot))
  end

  test "should destroy lot" do
    assert_difference('Lot.count', -1) do
      delete :destroy, id: @lot
    end

    assert_redirected_to lots_path
  end

  ### CUSTOM TESTS
  test "when receive a lot, PO Quantity Received increases by lot.received_qty" do
    ## TODO: make this code exact same as lot.create, so that we know its
    ## => actually testing the create code
    PURCHASE_ORDER_NUMBER = '20160814-01'
    po = PurchaseOrder.create(cost: 100, date: Date.today, purchase_order_number: PURCHASE_ORDER_NUMBER, description: 'test',
                              estimated_arrival: Date.tomorrow, supplier_id: Supplier.last.id, status: false)

    po.quantities.build
    po.quantities.each do |q|
      q.item_id = Item.last.id ## how to generalize this for a PO with multiple items
      q.update(amount_received: 0, amount_remaining: 0)
      q.save
    end
    @q = po.quantities.first
    lot = Lot.create(cleaned: false, inventory_qty: 0, received_qty: 10,
                          item_id: Item.last.id, number: 500, purchase_order_id: po.id,
                          status: 'inspection', received_date: Date.today, accepted_qty: nil,
                          rejected_qty: 0, date_cleaned: Date.today, ncmr: false,
                          full_po_qty: true)
    @q.amount_received += lot.received_qty

    assert_equal lot.received_qty, po.quantities.first.amount_received, 'Lot received_qty != po.amount_received'
  end

  test "when lot received, update lot.received_qty" do

    assert_equal lot.received_qty, #quantities.amount_received??
  end

  test "when lot received, PO status should change from pending to received or partial received"

  ### END CUSTOM TESTS
end
