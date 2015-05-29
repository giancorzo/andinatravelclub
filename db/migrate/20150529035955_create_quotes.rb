class CreateQuotes < ActiveRecord::Migration
  def change
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
      t.integer :adults
      t.integer :childs
      t.integer :age
      
      t.timestamps
    end
  end
end
