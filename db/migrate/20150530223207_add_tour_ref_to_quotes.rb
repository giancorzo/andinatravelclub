class AddTourRefToQuotes < ActiveRecord::Migration
  def change
    add_reference :quotes, :tour, index: true, foreign_key: true
  end
end
