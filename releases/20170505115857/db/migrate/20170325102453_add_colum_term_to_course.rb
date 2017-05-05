class AddColumTermToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :term, :integer, default: 0, null: false, limit: 4
  end
end
