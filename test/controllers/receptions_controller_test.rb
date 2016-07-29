require 'test_helper'

class ReceptionsControllerTest < ActionController::TestCase
  # include from Devise
  include Devise::Test::ControllerHelpers

  setup do
    @reception = receptions(:reception_one)
    # @po = purchase_orders(:purchase_order_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reception" do
    assert_difference('Reception.count') do
      post :create, reception: { date: @reception.date, description: @reception.description, quantity: @reception.quantity, purchase_order_id: @reception.purchase_order_id, item_id: @reception.item_id }
    end

    assert_redirected_to reception_path(assigns(:reception))
  end

  test "should show reception" do
    get :show, id: @reception
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reception
    assert_response :success
  end

  test "should update reception" do
    patch :update, id: @reception, reception: { date: @reception.date, description: @reception.description, quantity: @reception.quantity }
    assert_redirected_to reception_path(assigns(:reception))
  end

  test "should destroy reception" do
    assert_difference('Reception.count', -1) do
      delete :destroy, id: @reception
    end

    assert_redirected_to receptions_path
  end
end
