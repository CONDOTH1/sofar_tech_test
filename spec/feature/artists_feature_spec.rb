require 'rails_helper'

feature 'artists' do
  context 'artists are not visible' do
    scenario 'should display a artists heading' do
      visit '/artists'
      expect(page).to have_content 'No artists yet'
      expect(page).to have_link 'Add an Artist'
    end
  end

  context 'artists have been added' do
    before do
      Artist.create(title: 'Pat McCillen', genre: 'Acustic')
    end

    scenario 'display artists' do
      visit '/artists'
      expect(page).to have_content('Pat McCillen')
      expect(page).not_to have_content('No artists yet')
    end
  end

  context 'creating artists' do

    context 'a valid artist' do
      scenario 'prompts user to fill out a form, then displays the new artist' do
        visit '/artists'
        click_link 'Add an Artist'
        fill_in 'Title', with: 'Pat McCillen'
        click_button 'Create Artist'
        expect(page).to have_content 'Pat McCillen'
        expect(current_path).to eq '/artists'
      end
    end

    context 'an invalid artist' do
      scenario 'does not let you submit a name that is too short' do
        visit '/artists'
        click_link 'Add an Artist'
        fill_in 'Title', with: 'P'
        click_button 'Create Artist'
        expect(page).not_to have_css 'h2', text: 'Z'
        expect(page).to have_content 'error'
      end
    end

    context 'viewing artists' do

      let!(:pat){ Artist.create(title:'Pat McCillen', genre: 'Acustic') }

      scenario 'lets a user view a artists details' do
        visit '/artists'
        click_link 'Pat McCillen'
        expect(page).to have_content 'Pat McCillen'
        expect(current_path).to eq "/artists/#{pat.id}"
      end
    end

    context 'editing artists' do

      before { Artist.create title: 'Pat McCillen', genre: 'Acustic' }

      scenario 'let a user edit a artists' do
        visit '/artists'
        click_link 'Edit and Rate Pat McCillen'
        fill_in 'Title', with: 'Pat'
        fill_in 'Genre', with: 'Acustic/Soulful'
        click_button 'Update Artist'
        expect(page).to have_content 'Pat'
        expect(page).to have_content 'Acustic/Soulful'
        expect(current_path).to eq '/artists'
      end
    end

  context 'deleting artists' do

    before { Artist.create title: 'Pat McCillen', genre: 'Acustic' }

    scenario 'removes a artist when a user clicks a delete link' do
      visit '/artists'
      click_link 'Delete Pat McCillen'
      expect(page).not_to have_content 'Pat McCillen'
      expect(page).to have_content 'artist deleted successfully'
    end
  end


  context 'import api data' do
      scenario 'lets you import data from api' do
        VCR.use_cassette "model/music_api" do
          visit '/artists'
          click_link "Import Music From Api"
          expect(page).to have_content 'Pat McKillen'
        end
      end
    end
  end

end
