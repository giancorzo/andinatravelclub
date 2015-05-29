class AddPopularityToTours < ActiveRecord::Migration
  def change
    add_column :tours, :popularity, :integer, default: 0
  end
end
