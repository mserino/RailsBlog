require 'rails_helper'

describe 'Editing posts' do
	before do
		@post = Post.create title: 'Cool post', description: 'Wow I am so cool'
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