require 'rails_helper'

describe 'Post and comments' do
	let(:jack) { create(:jack) }
	
	before do
		login_as jack
		@post = jack.posts.create title: "Fantastic adventure", description: "look at my journey in south africa"
		visit root_path
		click_link "Leave a comment"
		fill_in "Name", with: "Maggie"
		fill_in "Email", with: "email@test.com"
		click_button "Submit"
	end
	
	it 'destroying a post destroys also the related comments' do
		click_link "Delete post"
		expect(@post.comments.count).to eq 0
	end
end