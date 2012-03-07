class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :description
      
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at          
      
      t.references :tour

      t.timestamps
    end
    
    execute <<-SQL
      ALTER TABLE images
        ADD CONSTRAINT fk_images_tours
        FOREIGN KEY (tour_id)
        REFERENCES tours(id)
    SQL
    
  end

  def self.down
    drop_table :images
  end
end
