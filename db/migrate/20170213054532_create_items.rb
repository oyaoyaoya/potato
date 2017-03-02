
class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :status
      t.text :explanation
      t.references :courses, foreign_key: true
      t.boolean   :purchased, default: false
      t.boolean   :contract

      t.timestamps
    end
  end
end
