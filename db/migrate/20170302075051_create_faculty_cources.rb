class CreateFacultyCources < ActiveRecord::Migration[5.0]
  def change
    create_table :faculty_cources do |t|
      t.references :faculty, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
