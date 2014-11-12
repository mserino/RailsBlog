require 'rails_helper'

describe 'Comments' do
	let(:jack) {create(:jack)}

	context 'logged in' do
		before do
			login_as jack
			@post = jack.posts.create title: "Hello I am Jack", description: "And this is my post"
		end

		context 'no comments' do
			it 'has no comments' do
				visit root_path
				expect(page).to have_content "0 comments"
			end
		end

		context 'with comments' do
			before do
				leave_comment
			end

			it 'can add one comment' do
				expect(current_path).to eq posts_path
				expect(page).to have_content "1 comment"
			end

			it 'can show the comment' do
				expect(page).to have_content "This post is very cool"
			end

			it 'can edit a comment if logged in' do
				click_link "Edit this comment"
				fill_in "Name", with: "Anna"
				click_button "Submit"
				expect(page).not_to have_content "Sue"
				expect(page).to have_content "Anna"
				expect(page).to have_content "Comment successfully updated"
			end

			it 'can delete a comment if logged in' do
				click_link "Delete this comment"
				expect(page).not_to have_content "Sue"
				expect(page).to have_content "0 comments"
				expect(page).to have_content "Comment successfully deleted"
			end
		end
	end

	context 'logged out' do
		before do
			login_as jack
			@post = jack.posts.create title: "Hello I am Jack", description: "And this is my post"
			leave_comment
			click_link "Sign out"
		end

		it 'cannot edit comment' do
			visit root_path
			expect(page).not_to have_content 'Edit this comment'
		end

		it 'cannod delete comment' do
			visit root_path
			expect(page).not_to have_content 'Delete this comment'
		end
	end

	def leave_comment
		visit root_path
		click_link "Leave a comment"
		fill_in "Name", with: "Sue"
		fill_in "Email", with: "sue@test.com"
		fill_in "Leave your comment", with: "This post is very cool"
		click_button 'Submit'
	end
end