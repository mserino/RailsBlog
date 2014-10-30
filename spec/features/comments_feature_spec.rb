require 'rails_helper'

describe 'Comments' do
	let(:jack) {create(:jack)}

	before do
		login_as jack
		@post = jack.posts.create title: "Hello I am Jack", description: "And this is my post"
	end

	it 'has no comments' do
		visit root_path
		expect(page).to have_content "0 comments"
	end

	it 'can add one comment' do
		visit root_path
		within('.comment') do
			fill_in "Name", with: "Sue"
			fill_in "Email", with: "sue@test.com"
			fill_in "Body", with: "This post is very cool"
			click_button 'Submit'
		end
		expect(page).to have_content "1 comments"
	end
end