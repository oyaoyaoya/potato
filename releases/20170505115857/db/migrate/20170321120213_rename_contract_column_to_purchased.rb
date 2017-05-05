class RenameContractColumnToPurchased < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :contract, :purchased
  end
end
