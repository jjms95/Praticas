class CreateComentariosPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios_posts do |t|
      t.references :post, foreign_key: true
      t.string :contenido

      t.timestamps
    end
  end
end
