require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_create_user
    user = User.new
    user.password = 'password'
    assert !user.valid?, "User shouldn't be created"
    user.name = 'Some name'
    assert !user.valid?, "User shouldn't be created"
    user.email = 'email@email.com'
    assert user.valid?, "User can be created"
    assert user.save, "User created"
  end

  def test_create_admin
    user = User.new
    user.password = 'password'
    assert !user.valid?, "User shouldn't be created"
    user.name = 'Some name'
    assert !user.valid?, "User shouldn't be created"
    user.email = 'email@email.com'
    assert user.valid?, "User can be created"
    user.admin = true
    assert user.save, "Admin created"
    assert user.admin, "User is admin"
  end

  def test_edit_user
    user = User.find(:all)[0]
    assert user.valid?, "User shouldn't be created"
    user.name = 'Some other name'
    assert user.valid?, "User shouldn't be created"
    user.email = 'otheremail@email.com'
    assert user.valid?, "User can be saved"
    assert user.save, "User saved"
  end

  def test_destroy_user
    user = User.find(:all)[0]
    assert user.destroy(), "User destroyd"
  end

end
