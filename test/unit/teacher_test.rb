require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  
  def test_create_teacher
    user = User.new
    user.password = 'password'
    assert !user.valid?, "User shouldn't be created"
    user.name = 'Some name'
    assert !user.valid?, "User shouldn't be created"
    user.email = 'email@email.com'
    assert user.valid?, "User can be created"
    assert user.save, "Admin created"
    teacher = Teacher.new
    teacher.user = user
    teacher.save
    assert user.teacher, "Teacher created"
  end

end
