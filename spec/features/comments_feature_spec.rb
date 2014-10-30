require 'rails_helper'

describe 'Comments' do
	let(:jack) {create(:jack)}

	before do
		login_as jack
		jack.posts.create title: "Hello I am Jack", description: "And this is my post"
	end

	it 'can have one comment' do
		Comment.create(name: "Sue", email: "sue@test.com", comment: "This post is so cool")
		expect(page).to have_content "1 comments"
	end
end