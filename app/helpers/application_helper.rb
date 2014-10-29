module ApplicationHelper
	def owner_of(post)
		(post.user.id == current_user.id) if current_user
	end
end
