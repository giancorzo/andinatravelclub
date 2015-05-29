class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      
      t.text :description
      t.text :short_description
      t.boolean :home, :default => false
      t.string :name      
      
      t.references :tour, index: true

      t.timestamps
    end
    
    add_foreign_key :reviews, :tours
  end
end
