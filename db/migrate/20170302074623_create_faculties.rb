class CreateFaculties < ActiveRecord::Migration[5.0]
  def change
    create_table :faculties do |t|
      t.references :school, foreign_key: true
      t.references :source_faculty, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
