require 'test_helper'

class DayPartsControllerTest < ActionController::TestCase
  setup do
    @day_part = day_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_part" do
    assert_difference('DayPart.count') do
      post :create, day_part: { location_id: @day_part.location_id, name: @day_part.name }
    end

    assert_redirected_to day_part_path(assigns(:day_part))
  end

  test "should show day_part" do
    get :show, id: @day_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @day_part
    assert_response :success
  end

  test "should update day_part" do
    patch :update, id: @day_part, day_part: { location_id: @day_part.location_id, name: @day_part.name }
    assert_redirected_to day_part_path(assigns(:day_part))
  end

  test "should destroy day_part" do
    assert_difference('DayPart.count', -1) do
      delete :destroy, id: @day_part
    end

    assert_redirected_to day_parts_path
  end
end
