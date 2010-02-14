require 'test_helper'

class LeasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lease" do
    assert_difference('Lease.count') do
      post :create, :lease => { }
    end

    assert_redirected_to lease_path(assigns(:lease))
  end

  test "should show lease" do
    get :show, :id => leases(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => leases(:one).to_param
    assert_response :success
  end

  test "should update lease" do
    put :update, :id => leases(:one).to_param, :lease => { }
    assert_redirected_to lease_path(assigns(:lease))
  end

  test "should destroy lease" do
    assert_difference('Lease.count', -1) do
      delete :destroy, :id => leases(:one).to_param
    end

    assert_redirected_to leases_path
  end
end
