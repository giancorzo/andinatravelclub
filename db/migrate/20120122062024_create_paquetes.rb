class CreatePaquetes < ActiveRecord::Migration
  def self.up
    create_table :paquetes do |t|
      t.string :titulo
      t.string :subtitulo
      t.string :descripcion_corta
      t.string :itinerario_corto
      t.string :itinerario_largo

      t.timestamps
    end
  end

  def self.down
    drop_table :paquetes
  end
end
