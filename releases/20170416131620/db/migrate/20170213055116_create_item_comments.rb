class CreateItemComments < ActiveRecord::Migration[5.0]
  def change
    create_table :item_comments do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
