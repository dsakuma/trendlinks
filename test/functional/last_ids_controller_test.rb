require 'test_helper'

class LastIdsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:last_ids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create last_id" do
    assert_difference('LastId.count') do
      post :create, :last_id => { }
    end

    assert_redirected_to last_id_path(assigns(:last_id))
  end

  test "should show last_id" do
    get :show, :id => last_ids(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => last_ids(:one).to_param
    assert_response :success
  end

  test "should update last_id" do
    put :update, :id => last_ids(:one).to_param, :last_id => { }
    assert_redirected_to last_id_path(assigns(:last_id))
  end

  test "should destroy last_id" do
    assert_difference('LastId.count', -1) do
      delete :destroy, :id => last_ids(:one).to_param
    end

    assert_redirected_to last_ids_path
  end
end
