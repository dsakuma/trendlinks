require 'test_helper'

class ResolvedsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resolveds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resolved" do
    assert_difference('Resolved.count') do
      post :create, :resolved => { }
    end

    assert_redirected_to resolved_path(assigns(:resolved))
  end

  test "should show resolved" do
    get :show, :id => resolveds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => resolveds(:one).to_param
    assert_response :success
  end

  test "should update resolved" do
    put :update, :id => resolveds(:one).to_param, :resolved => { }
    assert_redirected_to resolved_path(assigns(:resolved))
  end

  test "should destroy resolved" do
    assert_difference('Resolved.count', -1) do
      delete :destroy, :id => resolveds(:one).to_param
    end

    assert_redirected_to resolveds_path
  end
end
