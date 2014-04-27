require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'User can add and see bike' do
    visit '/'

    click_on "Add Bike"

    fill_in "brand", with: "Specialized"
    fill_in "model", with: "Rock Hopper"
    fill_in "year_made", with: "2010"
    click_on "Add Bike"

    expect(page).to have_content 'Specialized'
    expect(page).to have_content 'Rock Hopper'
    expect(page).to have_content '2010'
  end
end