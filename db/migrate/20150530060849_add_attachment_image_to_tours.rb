class AddAttachmentImageToTours < ActiveRecord::Migration
  def self.up
    change_table :tours do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tours, :image
  end
end