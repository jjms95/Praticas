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
 
	def edit
		@post = Post.find(params[:post_id])
		@comentarios_post = @post.comentarios_posts.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@comentarios_post = @post.comentarios_posts.find(params[:id])
		if @comentarios_post.update_attributes(comentarios_post_param)
			flash[:success] = "El comentario se guardo."
			redirect_to post_comentarios_posts_path
		else 
			flash[:error] = "hubo un error al guardar el comentario."
			render action: :new
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comentarios_post = @post.comentarios_posts.find(params[:id])
		if @comentarios_post.destroy
			flash[:success] = "El comentario se elimino."
			redirect_to post_comentarios_posts_path
		else 
			flash[:error] = "hubo un error al eliminar el comentario."
			render action: :new
		end
	end

	def url_options
		{post_id: params[:post_id]}.merge(super)
	end

	private
	def comentarios_post_param 
		params[:comentarios_post].permit(:contenido)
	end   
end
