class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@posts = Post.all.order(created_at: :desc)
		@posts = Post.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
		@last_posts = @posts.first(5)
		@comment = Comment.new
	end

	def show
		@posts = Post.all.order(created_at: :desc)
		@last_posts = @posts.first(5)
		@post = Post.find params[:id]
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params
		@post.user = current_user
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
		flash[:notice] = "Post successfully updated"
		redirect_to posts_path
	end

	def destroy
		@post = Post.find params[:id]
		@post.destroy
		flash[:notice] = "Post successfully deleted"
		redirect_to posts_path
	end

	def post_params
		params.require(:post).permit(:title, :description)		
	end
end