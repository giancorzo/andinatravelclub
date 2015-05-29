class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :description

      t.timestamps
    end
  end
end
