require 'rails_helper'

describe 'Adding posts' do
	it 'can add posts' do
		visit posts_path
		expect(page).to have_content "No posts yet"
	end
end