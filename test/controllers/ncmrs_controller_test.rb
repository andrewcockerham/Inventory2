require 'test_helper'

class NcmrsControllerTest < ActionController::TestCase
  setup do
    @ncmr = ncmrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ncmrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ncmr" do
    assert_difference('Ncmr.count') do
      post :create, ncmr: { number: @ncmr.number }
    end

    assert_redirected_to ncmr_path(assigns(:ncmr))
  end

  test "should show ncmr" do
    get :show, id: @ncmr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ncmr
    assert_response :success
  end

  test "should update ncmr" do
    patch :update, id: @ncmr, ncmr: { number: @ncmr.number }
    assert_redirected_to ncmr_path(assigns(:ncmr))
  end

  test "should destroy ncmr" do
    assert_difference('Ncmr.count', -1) do
      delete :destroy, id: @ncmr
    end

    assert_redirected_to ncmrs_path
  end
end
