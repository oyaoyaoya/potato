class AddColumnToDepartment < ActiveRecord::Migration[5.0]
  def change
    add_reference :departments, :faculty, foreign_key: true
  end
end
