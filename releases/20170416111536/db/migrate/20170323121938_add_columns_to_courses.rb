class AddColumnsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :course_num, :string
    add_column :courses, :hold_year, :integer
  end
end
