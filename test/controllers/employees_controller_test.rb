require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  # include from Devise
  include Devise::Test::ControllerHelpers

  setup do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:employee]

    @employee = employees(:one)
    # p @employee
    # p @employee.password
    # p @employee.encrypted_password

    # Use the sign_in helper to sign in a fixture `employee` record.
    sign_in employees(:one)
  end

#### these below tests are leftover and not needed since employees use Devise gem


  # test "should get index" do
  #   # @request.env['devise.mapping'] = Devise.mappings[:user]
  #   # p 'signed_in?'
  #   # p employee_signed_in?
  #   # p @employee.signed_in?
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:employees)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create employee" do
  #   p 'count='
  #   p Employee.count
  #   assert_difference('Employee.count') do
  #     post :create, employee: { email: @employee.email + '1', first_name: @employee.first_name, last_name: @employee.last_name, is_admin: @employee.is_admin, password: @employee.password, encrypted_password: @employee.encrypted_password }
  #     # post :create, employee: { email: @employee.email + '1', first_name: @employee.first_name, last_name: @employee.last_name, is_admin: @employee.is_admin, encrypted_password: @employee.send(:password_digest, '123greetings') }
  #     # post :create, employee: { email: @employee.email + '1', first_name: @employee.first_name, last_name: @employee.last_name, is_admin: @employee.is_admin }
  #     p 'count='
  #     p Employee.count
  #     p @employee.errors
  #     p @employee.password
  #     p @employee.encrypted_password

  #   end

  #   assert_redirected_to employee_path(assigns(:employee))
  # end

  # test "should show employee" do
  #   get :show, id: @employee
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @employee
  #   assert_response :success
  # end

  # test "should update employee" do
  #   patch :update, id: @employee, employee: { email: @employee.email + '1', first_name: @employee.first_name, last_name: @employee.last_name }

  #   # patch :update, id: @employee, employee: { email: @employee.email, first_name: @employee.first_name, last_name: @employee.last_name }
  #   # p @employee
  #   assert_redirected_to employee_path(assigns(:employee))
  # end

  # test "should destroy employee" do
  #   assert_difference('Employee.count', -1) do
  #     delete :destroy, id: @employee
  #   end

  #   assert_redirected_to employees_path
  # end
end
