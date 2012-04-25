class SubjectClassTeacher < ActiveRecord::Base
  belongs_to :subject
  belongs_to :student_class
  belongs_to :teacher
  # attr_accessible :title, :body
end
