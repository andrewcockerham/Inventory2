require 'test_helper'

class MyBuildsControllerTest < ActionController::TestCase
  setup do
    @my_build = my_builds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_builds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_build" do
    assert_difference('MyBuild.count') do
      post :create, my_build: { description: @my_build.description, qty: @my_build.qty, scrap_qty: @my_build.scrap_qty, ship_date: @my_build.ship_date, start_date: @my_build.start_date }
    end

    assert_redirected_to my_build_path(assigns(:my_build))
  end

  test "should show my_build" do
    get :show, id: @my_build
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_build
    assert_response :success
  end

  test "should update my_build" do
    patch :update, id: @my_build, my_build: { description: @my_build.description, qty: @my_build.qty, scrap_qty: @my_build.scrap_qty, ship_date: @my_build.ship_date, start_date: @my_build.start_date }
    assert_redirected_to my_build_path(assigns(:my_build))
  end

  test "should destroy my_build" do
    assert_difference('MyBuild.count', -1) do
      delete :destroy, id: @my_build
    end

    assert_redirected_to my_builds_path
  end
end
