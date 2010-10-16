require 'test_helper'

class LastHoursControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:last_hours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create last_hour" do
    assert_difference('LastHour.count') do
      post :create, :last_hour => { }
    end

    assert_redirected_to last_hour_path(assigns(:last_hour))
  end

  test "should show last_hour" do
    get :show, :id => last_hours(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => last_hours(:one).to_param
    assert_response :success
  end

  test "should update last_hour" do
    put :update, :id => last_hours(:one).to_param, :last_hour => { }
    assert_redirected_to last_hour_path(assigns(:last_hour))
  end

  test "should destroy last_hour" do
    assert_difference('LastHour.count', -1) do
      delete :destroy, :id => last_hours(:one).to_param
    end

    assert_redirected_to last_hours_path
  end
end
