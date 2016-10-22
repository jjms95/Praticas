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
		
		click_link "Nuevo Comentario"
		fill_in "Contenido", with: "hola me gusto"
		click_button "Guardar"

		expect(page).to have_content("El comentario se agrego.")

		within ("ul.comentarios_post") do
			expect(page).to have_content("hola me gusto")
		end 

	end

	it "lanza un error al no tener Contenido" do 
		visitar_comentario_post(post)
		
		click_link "Nuevo Comentario"
		fill_in "Contenido", with: ""
		click_button "Guardar"

		within ("div.flash") do
			expect(page).to have_content("hubo un error al agregar el comentario.")
		end  
		expect(page).to have_content("error")
	end

	it "lanza un error al no tener un Contenido menor de 2 caracteres" do 
		visitar_comentario_post(post)
		
		click_link "Nuevo Comentario"
		fill_in "Contenido", with: "1"
		click_button "Guardar"

		within ("div.flash") do
			expect(page).to have_content("hubo un error al agregar el comentario.") 
		end  
		expect(page).to have_content("error")
	end
end