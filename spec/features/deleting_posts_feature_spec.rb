require 'rails_helper'

describe 'Deleting post' do
	before do
		@post = Post.create title: 'First post', description: "Yay"
	end

	it 'can delete a post' do
		visit posts_path
		expect(page).to have_content 'First post'
		click_link 'Delete post'
		expect(page).not_to have_content 'First post'
	end
end