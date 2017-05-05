class AddStatusSomeTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_status, :integer, nul: false, dafault: 0
    add_column :schools, :school_status, :integer, nul: false, dafault: 0
    add_column :departments, :department_status, :integer, nul: false, dafault: 0
    add_column :faculties, :faculty_status, :integer, nul: false, dafault: 0
    add_column :courses, :course_status, :integer, nul: false, dafault: 0
    add_column :textbooks, :textbook_status, :integer, nul: false, dafault: 0
  end
end
