require 'test_helper'

class CurrentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:currents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create current" do
    assert_difference('Current.count') do
      post :create, :current => { }
    end

    assert_redirected_to current_path(assigns(:current))
  end

  test "should show current" do
    get :show, :id => currents(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => currents(:one).to_param
    assert_response :success
  end

  test "should update current" do
    put :update, :id => currents(:one).to_param, :current => { }
    assert_redirected_to current_path(assigns(:current))
  end

  test "should destroy current" do
    assert_difference('Current.count', -1) do
      delete :destroy, :id => currents(:one).to_param
    end

    assert_redirected_to currents_path
  end
end
