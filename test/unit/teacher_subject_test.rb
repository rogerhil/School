require 'test_helper'

class TeacherSubjectTest < ActiveSupport::TestCase
  def test_create_teacher_subject
    ts = TeacherSubject.new
    teacher = Teacher.find(:all)[0]
    subject = Subject.find(:all)[0]
    assert teacher, "Teacher selected"
    assert subject, "Subject selected"
    ts.teacher = teacher
    ts.subject = subject
    assert ts.save, "TeacherSubject created"
  end
end
