require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :admin

  validates :name,  :presence => true, :length => { :maximum => 128 }
  validates :email, :presence => true, :length => { :maximum => 128 }

  validates_uniqueness_of :email

  with_options :if => :new_record? do |nr|
    nr.validates :password, :presence => true, :length => { :in => 6..64 }, :confirmation => true
  end

  has_one :teacher
  has_one :student

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def type
    if self.teacher
      return 'Teacher'
    elsif self.student
      return 'Student'
    elsif self.admin
      return 'Admin'
    end
  end

end
