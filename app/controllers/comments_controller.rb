class CommentsController < ApplicationController
	def new
		@post = Post.find params[:post_id]
		@comment = Comment.new
	end

	def create
		@post = Post.find params[:post_id]
		@comment = @post.comments.create params[:comment].permit(:name, :email, :body)
		redirect_to posts_path
	end
end
