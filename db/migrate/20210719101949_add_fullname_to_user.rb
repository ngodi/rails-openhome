class AddFullnameToUser < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :fullname, :string
  end

  def down
    remove_column :users, :fullname
  end
end
