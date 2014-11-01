class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@posts = Post.all.order(created_at: :desc)
		@posts = Post.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
		@last_posts = @posts.first(5)
		@comment = Comment.new
		@comments = Comment.all
		@last_comments = @comments.last(5)
		@post_months = @posts.group_by{|t| t.created_at.beginning_of_month}
	end

	def show
		@posts = Post.all.order(created_at: :desc)
		@last_posts = @posts.first(5)
		@post = Post.find params[:id]
		@comments = Comment.all
		@last_comments = @comments.last(5)
		@post_months = @posts.group_by{|t| t.created_at.beginning_of_month}
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
		@comments = @post.comments
		@comments.each{|comment| comment.delete}
		@post.destroy
		flash[:notice] = "Post successfully deleted"
		redirect_to posts_path
	end

	def post_params
		params.require(:post).permit(:title, :description, :image)		
	end

	def add_image
    @file = params[:file].tempfile
    s3 = AWS::S3.new
    random = SecureRandom.hex
    image = s3.buckets['megblog'].objects.create("#{random}.jpg", @file)

    render(json: image.public_url)
	end
end