require 'rails_helper'

describe 'Deleting post' do
	let(:jack) { create(:user)}

	before do
		login_as jack
		@post = Post.create title: 'First post', description: "Yay"
	end

	it 'can delete a post' do
		visit posts_path
		expect(page).to have_content 'First post'
		click_link 'Delete post'
		expect(page).not_to have_content 'First post'
		expect(page).to have_content 'Post successfully deleted'
	end
end