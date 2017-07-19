require 'rails_helper'

describe "User creates a new restaurant" do
  scenario "a user can create a new restaurant" do
    visit new_restaurant_path

    fill_in "restaurant[name]", with: "Fruition"
    fill_in "restaurant[description]", with: "An Americana eatery focusing on locally sourced sustainable fresh ingredients."
    fill_in "restaurant[address]", with: "123 Some St. Denver CO"
    fill_in "restaurant[phone]", with: "720-555-5555"
    click_button "Create"


    expect(current_path).to eq("/restaurants/#{Restaurant.last.id}")
    expect(page).to have_content("Fruition")
  end
end
