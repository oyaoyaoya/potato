class AddColumnToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :complete_id, :integer
  end
end
