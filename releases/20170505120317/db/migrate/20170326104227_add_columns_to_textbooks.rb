class AddColumnsToTextbooks < ActiveRecord::Migration[5.0]
  def change
    add_column :textbooks, :author, :string
    add_column :textbooks, :publisher, :string
    add_column :textbooks, :published_year, :string
    add_column :textbooks, :isbn_10, :string
    add_column :textbooks, :isbn_13, :string
    add_column :textbooks, :issn_13, :string
    add_column :textbooks, :book_code, :string
    add_column :textbooks, :url, :text
  end
end
