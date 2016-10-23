require 'spec_helper'

describe "viendo la lista de comentarios" do
	let!(:post){Post.create(titulo: "mi post", cuerpo: "este es el cuerpo de mi post")}

	it "muestra el titulo de un post" do
		visitar_comentario_post(post)
		within ("h1") do
			expect(page).to have_content(post.titulo)
		end
		expect(page)
	end

	it "no muestra comentarios cuando los comnetarios_post estan vacios." do
		visitar_comentario_post(post)
		expect(page.all("ul.comentarios_post li").size).to eq(0)
	end

	it "muestra comentarios cuando los post los tienen." do
		post.comentarios_posts.create(contenido: "esta bien")
		post.comentarios_posts.create(contenido: "no me gusta")

		visitar_comentario_post(post)
		
		expect(page.all("ul.comentarios_post li").size).to eq(2)
	end
end