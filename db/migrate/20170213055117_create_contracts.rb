class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.references :item, foreign_key: true
      t.integer :purchaser_id
      t.integer :seller_id

      t.timestamps
    end
    add_index :contracts, :purchaser_id
    add_index :contracts, :seller_id
  end
end
