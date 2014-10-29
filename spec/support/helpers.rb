module CapybaraHelper
	def add_post
		fill_in "Title", with: "New post"
		fill_in "Description", with: "Description of the post"
		click_button "Submit"
	end
end