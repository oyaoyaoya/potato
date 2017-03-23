
class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :status
      t.references :textbook, foreign_key: true
      t.references :course, foreign_key: true
      t.boolean   :contract, default: false
      t.references :seller

      t.timestamps
    end
    add_foreign_key :items, :users, column: :seller_id
  end
end
