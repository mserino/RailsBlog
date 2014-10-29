require 'rails_helper'

describe 'Editing posts' do
	let(:jack) { create(:user)}

	before do
		login_as jack
		@post = jack.posts.create title: 'First post', description: "Yay"
	end

	it 'can edit a post' do
		visit posts_path
		click_link 'Edit post'
		fill_in 'Title', with: 'Changing the post'
		click_button 'Submit'
		expect(current_path).to eq posts_path
		expect(page).to have_content 'Changing the post'
		expect(page).to have_content "Post successfully updated"
		expect(page).not_to have_content 'Cool post'
	end
end