require 'test_helper'

class SubjectsControllerTest < ActionController::TestCase

  setup do
    @subject = subjects(:one)
    @teacher = Teacher.find(1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subjects)
  end

  test "should get new" do
    
    login_as(@teacher.user.id)
    get :new
    assert_response :success
  end

  test "should create subject" do
    login_as(@teacher.user.id)
    assert_difference('Subject.count') do
      post :create, :subject => { :description => @subject.description, :name => @subject.name }
    end

    assert_redirected_to subject_path(assigns(:subject))
  end

  test "should show subject" do
    get :show, :id => @subject
    assert_response :success
  end

  test "should get edit" do
    login_as(@teacher.user.id)
    get :edit, :id => @subject
    assert_response :success
  end

  test "should update subject" do
    login_as(@teacher.user.id)
    put :update, :id => @subject, :subject => { :description => @subject.description, :name => @subject.name }
    assert_redirected_to subject_path(assigns(:subject))
  end

  test "should destroy subject" do
    login_as(@teacher.user.id)
    assert_difference('Subject.count', -1) do
      delete :destroy, :id => @subject
    end

    assert_redirected_to subjects_path
  end
end
