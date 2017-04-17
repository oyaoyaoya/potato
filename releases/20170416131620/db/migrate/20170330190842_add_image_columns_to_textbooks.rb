class AddImageColumnsToTextbooks < ActiveRecord::Migration[5.0]
  def change
    add_column :textbooks, :small_thumbnail, :text
    add_column :textbooks, :thumbnail, :text
    add_column :textbooks, :info_link, :text
  end
end
