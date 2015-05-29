class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.string :subtitle
      
      t.references :tour, index: true

      t.timestamps
    end
    
    add_foreign_key :banners, :tours
  end
end
