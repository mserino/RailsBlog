require 'rails_helper'

describe "Forms validation" do
	let(:jack) {create(:jack)}
	before do
		login_as jack
	end

	context 'Post' do
		it 'validates presence of post title' do
			visit new_post_path
			find('#summernote').set "This is a post without a title"
			click_button "Submit"
			expect(page).to have_content "Title is required."
		end
	end

	context 'Comments' do
		before do
			visit new_post_path
			fill_in "Title", with: 'Pandas and hobbies'
			find('#summernote').set "Lorem ipsum blah blah blah"
			click_button "Submit"
		end

		it 'validates presence of name' do
			visit posts_path
			click_link "Leave a comment"
			fill_in "Email", with: "test@email.com"
			fill_in "Leave your comment", with: "I love pandas!"
			click_button "Submit"
			expect(page).to have_content "Name is required."
		end

		it 'validates presence of email' do
			visit posts_path
			click_link "Leave a comment"
			fill_in "Name", with: "Hugo"
			fill_in "Leave your comment", with: "I love pandas!"
			click_button "Submit"
			expect(page).to have_content "Email is required (will not be published)."
		end

		it 'validates presence of message' do
			visit posts_path
			click_link "Leave a comment"
			fill_in "Name", with: "Hugo"
			fill_in "Email", with: "test@email.com"
			click_button "Submit"
			expect(page).to have_content "Body of comment is required."
		end
	end
end