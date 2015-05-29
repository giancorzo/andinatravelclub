class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      
      t.string :description
      t.references :tour, index: true

      t.timestamps
    end
    
    add_foreign_key :images, :tours
    
  end
end
