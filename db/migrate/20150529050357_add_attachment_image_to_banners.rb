class AddAttachmentImageToBanners < ActiveRecord::Migration
  def self.up
    change_table :banners do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :banners, :image
  end
end
