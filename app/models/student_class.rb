class StudentClass < ActiveRecord::Base
  attr_accessible :name

  validates :name,  :presence => true, :length => { :maximum => 128 }

  has_many :subject_class_teacher
  has_many :student, :dependent => :nullify

end
