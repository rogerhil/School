class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :user
      t.references :student_class

      t.timestamps
    end
    add_index :students, :user_id
    add_index :students, :student_class_id
  end
end
