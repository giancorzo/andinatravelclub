class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.text :preview
      t.boolean :popular
      
      t.references :account

      t.timestamps
    end
    
    execute <<-SQL
      ALTER TABLE posts
        ADD CONSTRAINT fk_posts_accounts
        FOREIGN KEY (account_id)
        REFERENCES accounts(id)
    SQL

  end

  def self.down
    drop_table :posts
  end
end
