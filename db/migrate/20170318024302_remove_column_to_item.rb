class RemoveColumnToItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :purchased, :boolean
  end
end
