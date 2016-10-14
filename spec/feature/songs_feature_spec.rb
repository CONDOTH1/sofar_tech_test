require 'rails_helper'

feature 'songs' do
  before { Artist.create title: 'Pat' }

  scenario 'allows users to add a song using a form' do
     visit '/artists'
     click_link 'Add Song for Pat'
     fill_in "Title", with: "Found"
     select '3', from: 'Rating'
     click_button 'Add Song'

     expect(current_path).to eq '/artists'
     expect(page).to have_content('Found')
  end

end
