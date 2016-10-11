require 'spec_helper'

describe "viendo la lista de comentarios" do
	let!(:post){Post.create(titulo: "mi post", cuerpo: "este es el cuerpo de mi post")}

	it "no muestra comentarios cuando los comnetarios_post estan vacios." do
		visit "/posts"
		within "#post_#{post.id}" do
			click_link "Comentarios"
		end
		expect(page).to have_content("ComentariosPost#index")
	end
end