require 'test_helper'

class RentersControllerTest < ActionController::TestCase
  setup do
    @renter = renters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:renters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create renter" do
    assert_difference('Renter.count') do
      post :create, renter: { email: @renter.email, postcode: @renter.postcode }
    end

    assert_redirected_to renter_path(assigns(:renter))
  end

  test "should show renter" do
    get :show, id: @renter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @renter
    assert_response :success
  end

  test "should update renter" do
    put :update, id: @renter, renter: { email: @renter.email, postcode: @renter.postcode }
    assert_redirected_to renter_path(assigns(:renter))
  end

  test "should destroy renter" do
    assert_difference('Renter.count', -1) do
      delete :destroy, id: @renter
    end

    assert_redirected_to renters_path
  end
end
