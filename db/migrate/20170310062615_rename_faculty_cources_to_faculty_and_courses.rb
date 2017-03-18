class RenameFacultyCourcesToFacultyAndCourses < ActiveRecord::Migration[5.0]
  def change
    rename_table :faculty_cources, :faculty_and_courses
  end
end
