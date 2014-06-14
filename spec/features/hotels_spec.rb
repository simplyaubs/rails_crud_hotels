require 'spec_helper'

feature 'CRUD hotels' do
  scenario 'User can create a list of hotels' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a hotel'
    fill_in 'Name', with: 'Mandalay Bay'
    fill_in 'Rating', with: '4'
    click_on 'Add hotel'
    expect(page).to have_content 'Mandalay Bay'
    expect(page).to have_content '4'
  end

  scenario 'User can update a hotel' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a hotel'
    fill_in 'Name', with: 'Mandalay Bay'
    fill_in 'Rating', with: '4'
    click_on 'Add hotel'
    expect(page).to have_content 'Mandalay Bay'
    expect(page).to have_content '4'
    click_on 'Mandalay Bay'
    expect(page).to have_content 'Mandalay Bay'
    expect(page).to have_content '4'
    click_on 'Edit'
    fill_in 'Name', with: 'Aria'
    fill_in 'Rating', with: '3'
    click_on 'Update hotel'
    expect(page).to have_content 'Aria'
    expect(page).to have_content '3'
    expect(page).to_not have_content 'Mandalay Bay'
    expect(page).to_not have_content '4'
  end
end