class AddSchoolRefToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :school, foreign_key: true
    add_reference :users, :department, foreign_key: true
    add_reference :users, :faculty, foreign_key: true
    add_column :users, :name, :string
  end
end
