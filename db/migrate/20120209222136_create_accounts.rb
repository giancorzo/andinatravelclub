class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :email, :null => false
      t.string :crypt_password, :null => false
      t.string :salt

      t.timestamps
    end
    
    add_index :accounts, :email
  end

  def self.down
    drop_table :accounts
  end
end
