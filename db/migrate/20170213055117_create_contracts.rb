class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.references :item, foreign_key: true
      t.references :purchaser
      t.references :seller

      t.timestamps
    end
    add_foreign_key :contracts, :users, column: :purchaser_id
    add_foreign_key :contracts, :users, column: :seller_id
  end
end
