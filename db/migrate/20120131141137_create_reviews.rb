class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.text :description
      t.text :short_description
      t.boolean :home, :default => false
      t.string :name
      t.references :tour
      
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at      
      
      t.timestamps
    end
    
    execute <<-SQL
      ALTER TABLE reviews
        ADD CONSTRAINT fk_reviews_tours
        FOREIGN KEY (tour_id)
        REFERENCES tours(id)
    SQL
    
  end

  def self.down
    drop_table :reviews
  end
end
