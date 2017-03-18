class RenameContractMessagesToMessages < ActiveRecord::Migration[5.0]
  def change
     rename_table :contract_messages, :messages
  end
end
