class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params
		@post.save
		redirect_to posts_path
	end

	def edit
		@post = Post.find params[:id]
	end

	def update
		@post = Post.find params[:id]
		@post.update post_params
		@post.save
		redirect_to posts_path
	end

	def post_params
		params.require(:post).permit(:title, :description)		
	end
end