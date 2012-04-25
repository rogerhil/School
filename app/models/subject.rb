class Subject < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name,  :presence => true, :length => { :maximum => 128 }

  has_many :subject_class_teacher
  has_many :teacher_subject
end
