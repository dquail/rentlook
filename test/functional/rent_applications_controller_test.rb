require 'test_helper'

class RentApplicationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rent_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rent_application" do
    assert_difference('RentApplication.count') do
      post :create, :rent_application => { }
    end

    assert_redirected_to rent_application_path(assigns(:rent_application))
  end

  test "should show rent_application" do
    get :show, :id => rent_applications(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rent_applications(:one).to_param
    assert_response :success
  end

  test "should update rent_application" do
    put :update, :id => rent_applications(:one).to_param, :rent_application => { }
    assert_redirected_to rent_application_path(assigns(:rent_application))
  end

  test "should destroy rent_application" do
    assert_difference('RentApplication.count', -1) do
      delete :destroy, :id => rent_applications(:one).to_param
    end

    assert_redirected_to rent_applications_path
  end
end
