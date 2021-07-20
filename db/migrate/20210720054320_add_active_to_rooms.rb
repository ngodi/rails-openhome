class AddActiveToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :active, :boolean
  end
end
