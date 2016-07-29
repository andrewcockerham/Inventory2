require 'test_helper'

class PurchaseOrdersControllerTest < ActionController::TestCase
  # include from Devise
  include Devise::Test::ControllerHelpers

  setup do
    @purchase_order = purchase_orders(:purchase_order_one)
    @reception = receptions(:reception_one)
  end

# custom tests
  test "employee should not save without email" do
    # employee = Employee.new
    # assert_not employee.save
  end
#

  test "should get index" do
    # p @purchase_order
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order" do
    assert_difference('PurchaseOrder.count') do
      new_purchase_order_number = @purchase_order.purchase_order_number + "1"
      post :create, purchase_order: { cost: @purchase_order.cost, date: @purchase_order.date, purchase_order_number: new_purchase_order_number }
    end

    assert_redirected_to purchase_order_path(assigns(:purchase_order))
  end

  test "should show purchase_order" do
    get :show, id: @purchase_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_order
    assert_response :success
  end

  test "should update purchase_order" do
    patch :update, id: @purchase_order, purchase_order: { cost: @purchase_order.cost, date: @purchase_order.date, purchase_order_number: @purchase_order.purchase_order_number }
    assert_redirected_to purchase_order_path(assigns(:purchase_order))
  end

  test "should destroy purchase_order" do
    assert_difference('PurchaseOrder.count', -1) do
      delete :destroy, id: @purchase_order
    end

    assert_redirected_to purchase_orders_path
  end
end
