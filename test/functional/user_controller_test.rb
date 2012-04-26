require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  setup do
    @user = users(:admin)
    @admin = users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    
    login_as(@admin.id)
    get :new
    assert_response :success
  end

  test "should create user" do
    login_as(@admin.id)
    assert_difference('User.count') do
      post :create, :user => { :name => 'Some user', :email => 'some@email.com', :password => 'password' }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => @user
    assert_response :success
  end

  test "should get edit" do
    login_as(@admin.id)
    get :edit, :id => @user
    assert_response :success
  end

  test "should update subject" do
    login_as(@admin.id)
    put :update, :id => @user, :user => { :name => @user.name, :email => @user.email }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    login_as(@admin.id)
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user
    end

    assert_redirected_to users_path
  end

end
