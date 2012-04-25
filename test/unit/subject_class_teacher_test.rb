require 'test_helper'

class SubjectClassTeacherTest < ActiveSupport::TestCase
  
  def test_create_subject_class_teacher
    sct = SubjectClassTeacher.new
    sct.subject = Subject.find(:all)[0]
    sct.student_class = StudentClass.find(:all)[0]
    sct.teacher = Teacher.find(:all)[0]
    assert sct.new_record?, "Not created yet"
    assert sct.save, "SubjectClassTeacher created"
    assert !sct.new_record?, "New record"
  end

  def test_edit_subject_class_teacher
    sct = SubjectClassTeacher.find(:all)[0]
    sct.subject = Subject.find(:all)[1]
    sct.student_class = StudentClass.find(:all)[1]
    sct.teacher = Teacher.find(:all)[1]
    assert sct.save, "SubjectClassTeacher updated"
  end

  def test_destroy_subject_class_teacher
    sct = SubjectClassTeacher.find(:all)[0]
    assert sct.destroy, "SubjectClassTeacher destroyed"
  end

end
