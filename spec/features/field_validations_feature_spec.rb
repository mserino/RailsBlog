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
end