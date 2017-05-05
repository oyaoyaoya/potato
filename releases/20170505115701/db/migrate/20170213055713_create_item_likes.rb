class CreateItemLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :item_likes do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :like

      t.timestamps
    end
  end
end
