require 'test_helper'

class ShortsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create short" do
    assert_difference('Short.count') do
      post :create, :short => { }
    end

    assert_redirected_to short_path(assigns(:short))
  end

  test "should show short" do
    get :show, :id => shorts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shorts(:one).to_param
    assert_response :success
  end

  test "should update short" do
    put :update, :id => shorts(:one).to_param, :short => { }
    assert_redirected_to short_path(assigns(:short))
  end

  test "should destroy short" do
    assert_difference('Short.count', -1) do
      delete :destroy, :id => shorts(:one).to_param
    end

    assert_redirected_to shorts_path
  end
end
