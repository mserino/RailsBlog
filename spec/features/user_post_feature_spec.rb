require 'rails_helper'

describe 'User and Post' do
	let(:cindy) { create(:user) }
	
	before do
		login_as cindy
	end

	it 'post belongs to a user' do
		visit new_post_path
		add_post
		expect(page).to have_content "Posted by Cindy"
	end

	def add_post
		fill_in "Title", with: "New post"
		fill_in "Description", with: "Description of the post"
		click_button "Submit"
	end
end