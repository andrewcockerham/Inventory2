require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  # include from Devise
  include Devise::Test::ControllerHelpers

  setup do
    @item = items(:item_one)

    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:employee]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    # # Mimic the router behavior of setting the Devise scope through the env.
    # @request.env['devise.mapping'] = Devise.mappings[:employee]

    # # Use the sign_in helper to sign in a fixture `User` record.
    # sign_in employees(:alice)

    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { in_inspection_qty: @item.in_inspection_qty, name: @item.name, name_and_number: @item.name_and_number, ncmr_qty: @item.ncmr_qty, on_order_qty: @item.on_order_qty, part_number: @item.part_number, stock_qty: @item.stock_qty }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { in_inspection_qty: @item.in_inspection_qty, name: @item.name, name_and_number: @item.name_and_number, ncmr_qty: @item.ncmr_qty, on_order_qty: @item.on_order_qty, part_number: @item.part_number, stock_qty: @item.stock_qty }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
