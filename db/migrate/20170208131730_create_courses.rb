class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :faculty, foreign_key: true
      t.references :department, foreign_key: true
      t.references :school, foreign_key: true
      t.integer :text_presence, default: 0, null: false, limit: 1
      t.integer :period, default: 0, null: false, limit: 7
      t.integer :day, default: 0, null: false, limit: 6

      t.timestamps
    end
  end
end
