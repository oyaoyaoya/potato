class CreateUniversityDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :university_departments do |t|
      t.references :university, foreign_key: true
      t.references :department, foreign_key: true
      t.text :name

      t.timestamps
    end
  end
end
