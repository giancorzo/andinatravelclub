class AddSlugToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :slug, :string
    add_index :posts, :slug, :unique => true
  end

  def self.down
  end
end
