require 'rails_helper'

describe 'Deleting post' do
	let(:jack) { create(:jack)}

	before do
		login_as jack
		@post = jack.posts.create title: 'First post', description: "Yay"
	end

	it 'can delete a post' do
		visit posts_path
		expect(page).to have_content 'First post'
		click_link 'Delete post'
		expect(page).not_to have_content 'First post'
		expect(page).to have_content 'Post successfully deleted'
	end

	context 'logged in as an other user' do
		let(:cindy) {create(:user)}
		before do
			login_as cindy
		end

		it 'cannot delete if is not the creator of the post' do
			visit root_path
			expect(page).not_to have_content "Delete post"
		end
	end
end