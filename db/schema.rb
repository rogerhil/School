# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120424233846) do

  create_table "student_classes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.integer  "user_id"
    t.integer  "student_class_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "students", ["student_class_id"], :name => "index_students_on_student_class_id"
  add_index "students", ["user_id"], :name => "index_students_on_user_id"

  create_table "subject_class_teachers", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "student_class_id"
    t.integer  "teacher_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "subject_class_teachers", ["student_class_id"], :name => "index_subject_class_teachers_on_student_class_id"
  add_index "subject_class_teachers", ["subject_id"], :name => "index_subject_class_teachers_on_subject_id"
  add_index "subject_class_teachers", ["teacher_id"], :name => "index_subject_class_teachers_on_teacher_id"

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teacher_subjects", :force => true do |t|
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teacher_subjects", ["subject_id"], :name => "index_teacher_subjects_on_subject_id"
  add_index "teacher_subjects", ["teacher_id"], :name => "index_teacher_subjects_on_teacher_id"

  create_table "teachers", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teachers", ["user_id"], :name => "index_teachers_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",          :limit => 128
    t.string   "email",         :limit => 128
    t.boolean  "admin",                        :default => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "password_hash"
  end

end
