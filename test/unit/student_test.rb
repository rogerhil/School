require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def test_create_student
    user = User.new
    user.password = 'password'
    assert !user.valid?, "User shouldn't be created"
    user.name = 'Some name'
    assert !user.valid?, "User shouldn't be created"
    user.email = 'email@email.com'
    assert user.valid?, "User can be created"
    assert user.save, "Admin created"
    student = Student.new
    student.user = user
    student.save
    assert user.student, "Student created"
  end

end
