require 'test_helper'

class LandlordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:landlords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create landlord" do
    assert_difference('Landlord.count') do
      post :create, :landlord => { }
    end

    assert_redirected_to landlord_path(assigns(:landlord))
  end

  test "should show landlord" do
    get :show, :id => landlords(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => landlords(:one).to_param
    assert_response :success
  end

  test "should update landlord" do
    put :update, :id => landlords(:one).to_param, :landlord => { }
    assert_redirected_to landlord_path(assigns(:landlord))
  end

  test "should destroy landlord" do
    assert_difference('Landlord.count', -1) do
      delete :destroy, :id => landlords(:one).to_param
    end

    assert_redirected_to landlords_path
  end
end
