# require 'rails_helper'

# describe 'Italian field' do
#   let(:jack) { create(:jack)}

#   it 'can add italian version of the post', js: true do
#     login_as jack
#     visit root_path
#     click_link "New post"
#     save_and_open_page
#     fill_in "Title", with: "Vita di Adele"
#     find('#summernote').set "Very nice movie"
#     find('#summernote-ita').set "Molto carino come film"
#     click_button "Submit"
#     expect(page).not_to have_content "Molto carino come film"
#     find('.italian-version').click
#     expect(page).to have_content "Molto carino come film"
#   end
# end
