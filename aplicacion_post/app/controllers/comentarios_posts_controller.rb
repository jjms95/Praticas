class ComentariosPostsController < ApplicationController
  	def index
  		@post = Post.find(params[:post_id])
	end

	def new 
		@post = Post.find(params[:post_id])
		@comentarios_post = @post.comentarios_posts.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comentarios_post = @post.comentarios_posts.new(comentarios_post_param)
		if @comentarios_post.save
			flash[:success] = "El comentario se agrego."
			redirect_to post_comentarios_posts_path
		else
			flash[:error] = "hubo un error al agregar el comentario."
			render action: :new
		end
	end

	private
	def comentarios_post_param 
		params[:comentarios_post].permit(:contenido)
	end
end
