class Teacher < ActiveRecord::Base
  belongs_to :user

  has_many :subject_class_teacher
  has_many :teacher_subject

end
