require 'test_helper'

class StudentClassControllerTest < ActionController::TestCase

  setup do
    @class = student_classes(:one)
    @teacher = Teacher.find(1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_classes)
  end

  test "should get new" do
  	login_as(@teacher.user.id)
    get :new
    assert_response :success
  end

  test "should create student_class" do
    login_as(@teacher.user.id)
    assert_difference('StudentClass.count') do
      post :create, :student_class => { :name => 'A1' }, :subject => ['1', '2', '3'], :teacher__subject_1 => '1', :teacher__subject_2 => '1', :teacher__subject_3 => '2', :student => ['1', '2']
    end
    assert_redirected_to student_class_path(assigns(:student_class))
  end

  test "should show student_class" do
    get :show, :id => @class
    assert_response :success
  end

  test "should get edit" do
    login_as(@teacher.user.id)
    get :edit, :id => @class
    assert_response :success
  end

  test "should update student_class" do
    login_as(@teacher.user.id)
    put :update, :id => @class, :student_class => { :name => 'A2' }, :subject => ['1', '2'], :teacher__subject_1 => '1', :teacher__subject_2 => '2', :student => ['2']
    assert_redirected_to student_class_path(assigns(:student_class))
  end

  test "should destroy student_class" do
    login_as(@teacher.user.id)
    assert_difference('StudentClass.count', -1) do
      delete :destroy, :id => @class
    end

    assert_redirected_to student_classes_path
  end


end
