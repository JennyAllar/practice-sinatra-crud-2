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

  scenario 'User can edit a bike' do
    visit '/'

    click_on "Add Bike"

    fill_in "brand", with: "Specialized"
    fill_in "model", with: "Rock Hopper"
    fill_in "year_made", with: "2010"
    click_on "Add Bike"

    click_on "Specialized"

    fill_in "brand", with: "Trek"
    fill_in "model", with: "830"
    fill_in "year_made", with: "1994"
    click_on "Update Bike"

    expect(page).to have_content 'Trek'
    expect(page).to have_content '830'
    expect(page).to have_content '1994'
  end

  scenario 'User can delete a bike' do
    visit '/'
    click_on "Add Bike"

    fill_in "brand", with: "Trek"
    fill_in "model", with: "Rock Hopper"
    fill_in "year_made", with: "2010"
    click_on "Add Bike"

    click_on "Trek"

    click_on "Delete Bike"

    expect(page).to have_no_content "Trek"
  end
end