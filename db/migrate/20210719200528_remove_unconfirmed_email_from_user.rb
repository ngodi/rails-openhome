class RemoveUnconfirmedEmailFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :unconfirmed_email
  end
end
