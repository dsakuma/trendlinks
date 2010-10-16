require 'test_helper'

class ShortersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shorters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shorter" do
    assert_difference('Shorter.count') do
      post :create, :shorter => { }
    end

    assert_redirected_to shorter_path(assigns(:shorter))
  end

  test "should show shorter" do
    get :show, :id => shorters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shorters(:one).to_param
    assert_response :success
  end

  test "should update shorter" do
    put :update, :id => shorters(:one).to_param, :shorter => { }
    assert_redirected_to shorter_path(assigns(:shorter))
  end

  test "should destroy shorter" do
    assert_difference('Shorter.count', -1) do
      delete :destroy, :id => shorters(:one).to_param
    end

    assert_redirected_to shorters_path
  end
end
