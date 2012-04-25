class CreateSubjectClassTeachers < ActiveRecord::Migration
  def change
    create_table :subject_class_teachers do |t|
      t.references :subject
      t.references :student_class
      t.references :teacher

      t.timestamps
    end
    add_index :subject_class_teachers, :subject_id
    add_index :subject_class_teachers, :student_class_id
    add_index :subject_class_teachers, :teacher_id
  end
end
