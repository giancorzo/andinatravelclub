class AddToursToBanner < ActiveRecord::Migration
  def self.up
    add_column :banners, :tour_id, :integer

    execute <<-SQL
      ALTER TABLE banners
        ADD CONSTRAINT fk_banners_tours
        FOREIGN KEY (tour_id)
        REFERENCES tours(id)
    SQL
    
  end

  def self.down
  end
end
