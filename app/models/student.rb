class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :student_class
  # attr_accessible :title, :body
end
