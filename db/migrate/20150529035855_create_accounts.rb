class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email, :null => false
      t.string :crypt_password, :null => false
      t.string :salt

      t.timestamps
    end
    
    add_index :accounts, :email
  end
end
