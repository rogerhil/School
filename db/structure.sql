CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "student_classes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "students" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "student_class_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "subject_class_teachers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "subject_id" integer, "student_class_id" integer, "teacher_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "subjects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "teacher_subjects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "teacher_id" integer, "subject_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "teachers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(128), "email" varchar(128), "admin" boolean DEFAULT 'f', "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_hash" varchar(255));
CREATE INDEX "index_students_on_student_class_id" ON "students" ("student_class_id");
CREATE INDEX "index_students_on_user_id" ON "students" ("user_id");
CREATE INDEX "index_subject_class_teachers_on_student_class_id" ON "subject_class_teachers" ("student_class_id");
CREATE INDEX "index_subject_class_teachers_on_subject_id" ON "subject_class_teachers" ("subject_id");
CREATE INDEX "index_subject_class_teachers_on_teacher_id" ON "subject_class_teachers" ("teacher_id");
CREATE INDEX "index_teacher_subjects_on_subject_id" ON "teacher_subjects" ("subject_id");
CREATE INDEX "index_teacher_subjects_on_teacher_id" ON "teacher_subjects" ("teacher_id");
CREATE INDEX "index_teachers_on_user_id" ON "teachers" ("user_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120424001136');

INSERT INTO schema_migrations (version) VALUES ('20120424020229');

INSERT INTO schema_migrations (version) VALUES ('20120424020611');

INSERT INTO schema_migrations (version) VALUES ('20120424040707');

INSERT INTO schema_migrations (version) VALUES ('20120424043842');

INSERT INTO schema_migrations (version) VALUES ('20120424044734');

INSERT INTO schema_migrations (version) VALUES ('20120424050803');

INSERT INTO schema_migrations (version) VALUES ('20120424233650');

INSERT INTO schema_migrations (version) VALUES ('20120424233846');