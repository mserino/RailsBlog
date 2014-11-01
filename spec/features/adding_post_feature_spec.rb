require 'rails_helper'

describe 'Adding posts' do

	let(:jack) { create(:user)}

	it 'has no posts' do
		visit posts_path
		expect(page).to have_content "No posts yet"
	end

	it 'can show posts' do
		post = jack.posts.create title: "Title of the post", description: "Description of the post"
		login_as jack
		visit posts_path
		expect(page).to have_content "Title of the post"
		expect(page).to have_content "Description of the post"
	end

	context 'logged in' do
		
		before do
			login_as jack
		end

		it 'can add a post' do
			visit new_post_path
			fill_in "Title", with: "This is so cool"
			# fill_in "Description", with: "New description"
			find('#summernote').set "New description"
			click_button "Submit"
			expect(current_path).to eq posts_path
			expect(page).to have_content "This is so cool"
			expect(page).to have_content "New description"
		end

		it 'can attach image to a post' do
			visit posts_path
			click_link "New post"
			fill_in "Title", with: "Blog post"
			find('#summernote').set "New description"
			attach_file "Upload your image", Rails.root.join('spec/images/carlina.jpg')
			click_button "Submit"
			expect(page).to have_css 'img.uploaded-pic'
		end
	end

	context 'logged out' do
		it 'cannot add a post' do
			visit new_post_path
			expect(page).to have_content "You need to sign in or sign up before continuing."
		end

		it 'cannot see the new post link' do
			visit root_path
			expect(page).not_to have_content "New post"
		end
	end

end