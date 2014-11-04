require 'rails_helper'

describe 'Italian field' do
  let(:jack) { create(:jack)}
  before do
    login_as jack
  end

  it 'can add italian version of the post' do
    visit root_path
    click_link "New post"
    fill_in "Title", with: "Vita di Adele"
    find('#summernote').set "Very nice movie"
    find('#summernote-ita').set "Molto carino come film"
    click_button "Submit"
  end
end