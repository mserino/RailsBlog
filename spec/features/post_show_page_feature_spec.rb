require 'rails_helper'

describe 'Show page' do
	let(:jack) {create(:jack)}
	
	before do
		@post = jack.posts.create title: "Let's talk about coding", description: "This is the new post"
		login_as jack
	end

	it 'redirects to the page of the single post' do
		visit posts_path
		click_single_post
		expect(current_path).to eq post_path(@post)
	end

	it 'shows the single post on the page' do
		visit posts_path
		click_single_post
		expect(page).to have_content "Let's talk about coding"
	end

	def click_single_post
		within ".post_section" do
			expect(page).to have_content "Let's talk about coding"
			click_link "Let's talk about coding"
		end
	end
end