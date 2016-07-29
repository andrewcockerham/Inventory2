require 'test_helper'

class LotsControllerTest < ActionController::TestCase
  # include from Devise
  include Devise::Test::ControllerHelpers

  setup do
    @lot = lots(:one)
  end

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
                           full_po_qty: true, full_po_checkbox: {"full_po_qty"=>"1"} }
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
end
