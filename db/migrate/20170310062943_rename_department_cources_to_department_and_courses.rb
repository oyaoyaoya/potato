class RenameDepartmentCourcesToDepartmentAndCourses < ActiveRecord::Migration[5.0]
  def change
    rename_table :department_cources, :department_and_courses
  end
end
