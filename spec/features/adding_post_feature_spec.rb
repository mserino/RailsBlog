require 'rails_helper'

describe 'Adding posts' do
	it 'has no posts' do
		visit posts_path
		expect(page).to have_content "No posts yet"
	end

	it 'can show posts' do
		post = Post.create title: "Title of the post", description: "Description of the post"
		visit posts_path
		expect(page).to have_content "Title of the post"
		expect(page).to have_content "Description of the post"
	end

	it 'can add a post' do
		visit new_post_path
		fill_in "Title", with: "New post"
		fill_in "Description", with: "New description"
		click_button "Submit"
		expect(current_path).to eq posts_path
		expect(page).to have_content "New post"
		expect(page).to have_content "New description"
	end

end