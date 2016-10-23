require 'spec_helper'

describe "agregando comentarios" do
	let!(:post){Post.create(titulo: "mi post", cuerpo: "este es el cuerpo de mi post")}
	let!(:comentario_post){post.comentarios_posts.create(contenido: "este es un comentario de mi post")}

	it "Elimina un comentario en un post exitosamente" do
		visitar_comentario_post(post)

		within "#comentarios_post_#{comentario_post.id}" do
			click_link "Eliminar Comentario"
		end

		expect(page).to have_content("El comentario se elimino.")
		expect(ComentariosPost.count).to eq(0)
	end
end