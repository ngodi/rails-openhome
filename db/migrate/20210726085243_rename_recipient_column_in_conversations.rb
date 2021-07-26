class RenameRecipientColumnInConversations < ActiveRecord::Migration[6.1]
  def change
    rename_column :conversations, :recepient_id, :recipient_id
  end
end
