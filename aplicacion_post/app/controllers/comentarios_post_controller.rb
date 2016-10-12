class ComentariosPostController < ApplicationController
  	def index
  		@comentarios_posts=ComentariosPost.all
	end
end
