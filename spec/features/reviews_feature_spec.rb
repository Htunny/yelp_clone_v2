require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'Leon'}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review Leon'
    fill_in "Thoughts", with: "Not bad"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('Not bad')
  end
end
