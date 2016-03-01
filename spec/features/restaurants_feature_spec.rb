require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'Leon')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('Leon')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'creating a restaurant' do
    scenario 'prompts the user to fill out the form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in "Name", with: 'Leon'
      click_button 'Create restaurant'
      expect(page).to have_content 'Leon'
      expect(current_path).to eq '/restaurants'
    end
  end
end
