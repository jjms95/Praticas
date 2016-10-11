require 'spec_helper'

describe "Editando un post" do
	let!(:post){Post.create(titulo: "tototo", cuerpo: "tototototo")}

	def update_post (options={})
		options[:titulo] ||= "my todo list"
		options[:cuerpo] ||= "this is my todo list"
		post=options[:post]

		visit "/posts"
		within "#post_#{post.id}" do
			click_link "Edit"
		end

		fill_in "Titulo", with: options[:titulo]
		fill_in "Cuerpo", with: options[:cuerpo] 
		click_button "Update Post"
	end

	it "Actualiza la informacion de un post correctamente" do
		update_post post: post,
			titulo: "Los perros negros",
			cuerpo: "estan definidos por sus ojos"

		post.reload

		expect(page).to have_content("Post was successfully updated.") 
		expect(post[:titulo]).to eq("Los perros negros")
		expect(post[:cuerpo]).to eq("estan definidos por sus ojos")
	end

	it "lanza un error cuando el titulo esta vacio" do
	update_post post: post,
			titulo: ""
		expect(page).to have_content("error") 
	end

		it "lanza un error cuando el titulo tiene menos de 3 caracteres" do
	update_post post: post,
			titulo: "Lo"
		expect(page).to have_content("error") 
	end

		it "lanza un error cuando el cuerpo esta vacio" do
	update_post post: post,
			cuerpo: ""
		expect(page).to have_content("error") 
	end

		it "lanza un error cuando el cuerpo tiene menos de 5 caracteres" do
	update_post post: post,
			cuerpo: "Los"
		expect(page).to have_content("error") 
	end
end