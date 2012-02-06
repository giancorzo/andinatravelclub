class CreateTours < ActiveRecord::Migration
  def self.up
    create_table :tours do |t|
      t.string :title
      t.string :subtitle
      t.text :short_description
      t.text :short_itinerary
      t.text :itinerary

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
     
      t.timestamps
    end
    
    add_index :tours, :id
  end

  def self.down
    drop_table :tours
  end
end
