require 'test_helper'

class StudentClassTest < ActiveSupport::TestCase

  def test_create_student_class
    student_class = StudentClass.new
    assert !student_class.valid?, "StudentClass shouldn't be created without name"
    student_class.name = 'Mathematics'
    assert student_class.valid?, "StudentClass can be created"
    student_class.save
    assert !student_class.new_record?, "StudentClass created succesfully"
  end

  def test_edit_student_class
    student_class = StudentClass.find(:all)[0]
    assert student_class.valid?, "StudentClass can be updated"
    student_class.name = ''
    assert !student_class.valid?, "StudentClass shouldn't be created without name"
    student_class.name = 'History'
    assert student_class.valid?, "StudentClass can be updated"
    student_class.save
  end

  def test_destroy_student_class
    student_class = StudentClass.find(:all)[0]
    assert student_class.destroy, "StudentClass destroyed"
  end

end
