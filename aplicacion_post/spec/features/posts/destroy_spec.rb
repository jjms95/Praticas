require 'spec_helper'

describe "Eliminando un post" do
	let!(:post){Post.create(titulo: "tototo", cuerpo: "tototototo")}

	it "redireccionara a la pagina principal sin el post eliminado" do
		visit "/posts"
		within "#post_#{post.id}" do
			click_link "Destroy"
		end
		expect(page).to_not have_content(post.titulo)
		expect(Post.count).to eq(0) 
	end
end
