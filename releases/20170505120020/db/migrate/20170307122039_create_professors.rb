class CreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :name
      t.references :faculty, foreign_key: true
      t.references :department, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
