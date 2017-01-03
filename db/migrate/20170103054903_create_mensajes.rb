class CreateMensajes < ActiveRecord::Migration[5.0]
  def change
    create_table :mensajes do |t|
      t.string :mensaje

      t.timestamps
    end
  end
end
