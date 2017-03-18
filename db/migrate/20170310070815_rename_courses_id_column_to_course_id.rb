class RenameCoursesIdColumnToCourseId < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :courses_id, :course_id
  end
end
