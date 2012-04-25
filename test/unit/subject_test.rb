require 'test_helper'

class SubjectTest < ActiveSupport::TestCase

  def test_create_subject
    subject = Subject.new
    assert !subject.valid?, "Subject shouldn't be created without name"
    subject.name = 'Mathematics'
    assert subject.valid?, "Subject can be created"
    subject.save
    assert !subject.new_record?, "Subject created succesfully"
  end

  def test_edit_subject
    subject = Subject.find(:all)[0]
    assert subject.valid?, "Subject can be updated"
    subject.name = ''
    assert !subject.valid?, "Subject shouldn't be created without name"
    subject.name = 'Mathematics'
    assert subject.valid?, "Subject can be updated"
    subject.save
  end

  def test_destroy_subject
    subject = Subject.find(:all)[0]
    assert subject.destroy, "Subject destroyed"
  end

end
