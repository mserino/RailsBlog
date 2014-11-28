class CommentsController < ApplicationController
	def new
		@post = Post.find params[:post_id]
		@comment = Comment.new
	end

	def create
		@post = Post.find params[:post_id]
		@comment = @post.comments.new comment_params
		if @comment.save
			flash[:notice] = "Thank you for your comment"
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find params[:post_id]
		@comment = Comment.find params[:id]
	end

	def update
		@comment = Comment.find params[:id]
		@comment.update comment_params
		@comment.save
		flash[:notice] = "Comment successfully updated"
		redirect_to posts_path
	end

	def destroy
		@comment = Comment.find params[:id]
		@comment.destroy
		flash[:notice] = "Comment successfully deleted"
		redirect_to posts_path
	end


	def comment_params
		params.require(:comment).permit(:name, :email, :body)
	end
end
