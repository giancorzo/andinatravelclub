class CreateMedia < ActiveRecord::Migration
  def self.up
    create_table :media do |t|
      t.string :description
      t.string :content_file_name
      t.string :content_content_type
      t.integer :content_file_size
      t.datetime :content_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :media
  end
end
