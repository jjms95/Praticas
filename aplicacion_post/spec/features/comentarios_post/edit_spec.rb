require 'spec_helper'

describe "agregando comentarios" do
	let!(:post){Post.create(titulo: "mi post", cuerpo: "este es el cuerpo de mi post")}
	let!(:comentario_post){post.comentarios_posts.create(contenido: "este es el cuerpo un comentario de mi post")}

	def visitar_comentario_post(p)
		visit "/posts"
		within "#post_#{p.id}" do
			click_link "Comentarios"
		end
	end	

	it "Cambia un comentario en un post exitosamente" do
		visitar_comentario_post(post)

		click_link "Editar Comentario"
		fill_in "Contenido", with: "hola me gusto"
		click_button "Guardar"

		expect(page).to have_content("El comentario se guardo.")
		comentario_post.reload
		expect(comentario_post.contenido).to eq("hola me gusto")
	end

	it "error al cambiar un comentario en un post por estar vacio" do
		visitar_comentario_post(post)

		click_link "Editar Comentario"
		fill_in "Contenido", with: ""
		click_button "Guardar"

		expect(page).to_not have_content("El comentario se guardo.")
		expect(page).to have_content("hubo un error al guardar el comentario.")
		comentario_post.reload
		expect(comentario_post.contenido).to eq("este es el cuerpo un comentario de mi post")
	end

	it "error al cambiar un comentario en un post por tener menos de dos caracteres" do
		visitar_comentario_post(post)

		click_link "Editar Comentario"
		fill_in "Contenido", with: "1"
		click_button "Guardar"

		expect(page).to_not have_content("El comentario se guardo.")
		expect(page).to have_content("hubo un error al guardar el comentario.")
		comentario_post.reload
		expect(comentario_post.contenido).to eq("este es el cuerpo un comentario de mi post")
	end
end