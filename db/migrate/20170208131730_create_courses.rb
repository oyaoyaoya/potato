class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :text_presence, default: 0, null: false, limit: 1
      t.integer :period, default: 0, null: false, limit: 1
      t.integer :day, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
