require 'spec_helper'

describe "agregando comentarios" do
	let!(:post){Post.create(titulo: "mi post", cuerpo: "este es el cuerpo de mi post")}

	def visitar_comentario_post(p)
		visit "/posts"
		within "#post_#{p.id}" do
			click_link "Comentarios"
		end
	end	

	it "crea satisfactoriamente un comentario en un post" do
		visitar_comentario_post(post)
		
		click_link "New Comment"
		fill_in "Contenido", with: "hola me gusto"
		click_button "Save"

		expect(page).to have_content("El comentario se agrego.")

		within ("ul.comentarios_post") do
			expect(page).to have_content("hola me gusto")
		end

	end
end