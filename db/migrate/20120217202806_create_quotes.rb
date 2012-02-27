class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.string :travel_type
      t.integer :days
      t.date :travel_time
      t.string :name
      t.string :country      
      t.string :city
      t.string :phone
      t.string :email
      t.string :payment_type
      t.string :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
