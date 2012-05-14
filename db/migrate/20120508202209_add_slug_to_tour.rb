class AddSlugToTour < ActiveRecord::Migration

  def self.up
    add_column :tours, :slug, :string
    add_index :tours, :slug, :unique => true    
  end

  def self.down
  end
end
