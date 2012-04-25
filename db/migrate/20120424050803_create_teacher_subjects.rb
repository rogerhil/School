class CreateTeacherSubjects < ActiveRecord::Migration
  def change
    create_table :teacher_subjects do |t|
      t.references :teacher
      t.references :subject

      t.timestamps
    end
    add_index :teacher_subjects, :teacher_id
    add_index :teacher_subjects, :subject_id
  end
end
