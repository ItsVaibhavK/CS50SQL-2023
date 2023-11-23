CREATE INDEX "enrollment_index" ON "enrollments" ("student_id", "course_id");
CREATE INDEX "satisfaction_index" ON "satisfies" ("course_id", "requirement_id");
CREATE INDEX "department_index" ON "courses" ("department", "number");
CREATE INDEX "course_index" ON "courses" ("semester", "title");