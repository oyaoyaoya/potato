class CreateUserEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_evaluations do |t|
      t.integer :purchaser_id
      t.integer :seller_id
      t.references :item, foreign_key: true
      t.integer :evaluation
      t.text :evalation_body

      t.timestamps
    end
    add_index :user_evaluations, :purchaser_id
    add_index :user_evaluations, :seller_id
  end
end
