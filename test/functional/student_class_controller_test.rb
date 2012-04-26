require 'test_helper'

class StudentClassControllerTest < ActionController::TestCase

  setup do
    @class = student_classes(:class_a1)
    @teacher = teachers(:teacher1)
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
      post :create, :student_class => { :name => 'A2' }, :subject => [subjects(:math).id, subjects(:history).id, subjects(:biology).id,],
                                       "teacher__subject_" + String(subjects(:math).id) => teachers(:teacher1).id,
                                       "teacher__subject_" + String(subjects(:history).id) => teachers(:teacher2).id,
                                       "teacher__subject_" + String(subjects(:biology).id) => teachers(:teacher2).id,
                                        :student => [students(:student1).id, students(:student2).id]
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
    put :update, :id => @class, :student_class => { :name => 'A2' }, :subject => [subjects(:math).id, subjects(:history).id],
                                                  "teacher__subject_" + String(subjects(:math).id) => teachers(:teacher1).id,
                                                  "teacher__subject_" + String(subjects(:history).id) => teachers(:teacher2).id,
                                                  :student => [students(:student1).id]
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
