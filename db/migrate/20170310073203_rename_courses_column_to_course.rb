class RenameCoursesColumnToCourse < ActiveRecord::Migration[5.0]
  def change
    rename_column :textbooks, :courses_id, :course_id
  end
end
