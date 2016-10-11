require 'spec_helper'

describe "Creando un post" do

	def create_post (options={})
		options[:titulo] ||= "my todo list"
		options[:cuerpo] ||= "this is my todo list"

		visit "/posts"
		click_link "New Post" 
		expect(page).to have_content("New Post")

		fill_in "Titulo", with: options[:titulo]
		fill_in "Cuerpo", with: options[:cuerpo] 
		click_button "Create Post"
	end

	it "redirecciona a la pagina principal con el nuevo post" do
		create_post()

		expect(page).to have_content("my todo list")
	end 

	it "muestra un error cuando el titulo no esta lleno" do
		expect(Post.count).to eq(0)

		create_post(titulo: "") 

		expect(page).to have_content("error")
		expect(Post.count).to eq(0)

		visit "/posts"
		expect(page).to_not have_content("this is my todo list") 
	end

	it "muestra un error cuando el titulo tiene menos de 3 caracteres" do
		expect(Post.count).to eq(0)

		create_post(titulo: "yo") 

		expect(page).to have_content("error")
		expect(Post.count).to eq(0)

		visit "/posts"
		expect(page).to_not have_content("this is my todo list") 
	end

	it "muestra un error cuando el cuerpo no esta llena" do
		expect(Post.count).to eq(0)

		create_post(cuerpo: "") 

		expect(page).to have_content("error")
		expect(Post.count).to eq(0)

		visit "/posts"
		expect(page).to_not have_content("my todo list") 
	end

	it "muestra un error cuando el cuerpo tiene menos de 5 caracteres" do
		expect(Post.count).to eq(0)

		create_post(cuerpo: "yoyo") 

		expect(page).to have_content("error")
		expect(Post.count).to eq(0)

		visit "/posts"
		expect(page).to_not have_content("my todo list") 
	end

end