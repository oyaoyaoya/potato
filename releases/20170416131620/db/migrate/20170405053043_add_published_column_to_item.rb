class AddPublishedColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :published, :boolean, default: true, null: false
  end
end
