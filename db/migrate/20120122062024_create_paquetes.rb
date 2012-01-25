class CreatePaquetes < ActiveRecord::Migration
  def self.up
    create_table :paquetes do |t|
      t.string :titulo
      t.string :subtitulo
      t.text :descripcion_corta
      t.text :itinerario_corto
      t.text :itinerario_largo

      t.timestamps
    end
  end

  def self.down
    drop_table :paquetes
  end
end
