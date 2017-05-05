class AddColumnToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :professor, foreign_key: true
  end
end
