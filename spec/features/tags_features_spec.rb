require 'rails_helper'

describe 'Tagging' do
	let(:harry) { create(:user) }

	before do
		login_as harry
	end

	it 'can add tags' do
		visit root_path
		click_link "New post"
		add_post_with_tag
		expect(page).to have_content "Tags: order of the phoenix, harry potter"
	end

	it 'can add tags with link' do
		visit root_path
		click_link "New post"
		add_post_with_tag
		expect(page).to have_link "harry potter"
	end

	it 'clicking on the link go on the related post' do
		visit root_path
		click_link "New post"
		add_post_with_tag
		click_link "New post"
		add_second_post
		click_link "New post"
		add_third_post
		first(:link, "harry potter").click
		expect(page).to have_content "And the Order of the Phoenix"
		expect(page).to have_content "And the Prisoner of Azkaban"
		expect(page).not_to have_content "Lord of the Rings"
	end

	def add_post_with_tag
		fill_in "Title", with: "Harry Potter"
		find('#summernote').set "And the Order of the Phoenix"
		fill_in "Tags (separated by commas)", with: "harry potter, order of the phoenix"
		click_button "Submit"
	end

	def add_second_post
		fill_in "Title", with: "Harry Potter"
		find('#summernote').set "And the Prisoner of Azkaban"
		fill_in "Tags (separated by commas)", with: "harry potter, prisoner of azkaban"
		click_button "Submit"
	end

	def add_third_post
		fill_in "Title", with: "Lord of the Rings"
		find('#summernote').set "The company of the Ring"
		fill_in "Tags (separated by commas)", with: "lord of the rings"
		click_button "Submit"
	end
end