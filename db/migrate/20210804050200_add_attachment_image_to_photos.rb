class AddAttachmentImageToPhotos < ActiveRecord::Migration[6.1]
  def self.up
    add_column :photos, :image, :attachment
  end

  def self.down
    remove_column :photos, :image
  end
end

