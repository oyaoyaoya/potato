class AddColumnInfoToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :info, :string
    add_column :courses, :professor_name, :string
  end
end
