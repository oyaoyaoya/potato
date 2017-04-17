class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :completed, :boolean, default: false, null: false
  end
end
