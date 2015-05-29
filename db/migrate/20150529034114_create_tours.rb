class CreateTours < ActiveRecord::Migration
  def self.up
    create_table :tours do |t|
      t.string :title
      t.string :subtitle
      t.text :short_description
      t.text :short_itinerary
      t.text :itinerary
      t.integer :days
      t.integer :nights
      t.integer :price
      t.boolean :place, default: false
      t.string :slug, unique: true
      
      t.references :interest, index: true

      t.timestamps
    end
    
    add_foreign_key :tours, :interests
    
  end
  
  def self.down
    drop_table :tours
  end
end
