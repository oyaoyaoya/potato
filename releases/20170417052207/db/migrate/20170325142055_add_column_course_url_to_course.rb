class AddColumnCourseUrlToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :url, :text
  end
end
