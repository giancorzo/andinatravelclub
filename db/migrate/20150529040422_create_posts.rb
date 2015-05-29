class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.text :preview
      t.boolean :popular
      t.string :slug, unique: true
      t.references :account, index: true

      t.timestamps
    end
    
    add_foreign_key :posts, :accounts
  end
end
