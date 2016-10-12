class ComentariosPostsController < ApplicationController
  	def index
  		@post = Post.find(params[:post_id])
	end

	def new 
		@post = Post.find(params[:post_id])
		@comentarios_post = @post.comentarios_posts.new
	end
end
