class CreateTextCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :text_counts do |t|
      t.text :info
      t.string :name
      t.references :course, foreign_key: true
      t.string :text_length
      t.string :text_byte
      t.text :text_lines
      t.timestamps
    end
  end
end
