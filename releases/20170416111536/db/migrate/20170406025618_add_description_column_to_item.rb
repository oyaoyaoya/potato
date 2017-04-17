class AddDescriptionColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :delivery, :integer, null: false, limit: 2
  end
end
