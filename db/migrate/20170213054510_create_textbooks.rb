class CreateTextbooks < ActiveRecord::Migration[5.0]
  def change
    create_table :textbooks do |t|
      t.string :name
      t.integer :price
      t.text :explanation
      t.references :courses, foreign_key: true


      t.timestamps
    end
  end
end
