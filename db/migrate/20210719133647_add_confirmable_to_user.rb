class AddConfirmableToUser < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
  end

  def down
    remove_column :users, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
  end

end
