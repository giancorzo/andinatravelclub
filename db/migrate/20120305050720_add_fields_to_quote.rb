class AddFieldsToQuote < ActiveRecord::Migration
  def self.up
    add_column :quotes, :adults, :integer
    add_column :quotes, :childs, :integer
    add_column :quotes, :age, :integer
  end

  def self.down
  end
end
