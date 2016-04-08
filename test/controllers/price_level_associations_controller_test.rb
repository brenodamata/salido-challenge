require 'test_helper'

class PriceLevelAssociationsControllerTest < ActionController::TestCase
  setup do
    @price_level_association = price_level_associations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:price_level_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create price_level_association" do
    assert_difference('PriceLevelAssociation.count') do
      post :create, price_level_association: {  }
    end

    assert_redirected_to price_level_association_path(assigns(:price_level_association))
  end

  test "should show price_level_association" do
    get :show, id: @price_level_association
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @price_level_association
    assert_response :success
  end

  test "should update price_level_association" do
    patch :update, id: @price_level_association, price_level_association: {  }
    assert_redirected_to price_level_association_path(assigns(:price_level_association))
  end

  test "should destroy price_level_association" do
    assert_difference('PriceLevelAssociation.count', -1) do
      delete :destroy, id: @price_level_association
    end

    assert_redirected_to price_level_associations_path
  end
end
