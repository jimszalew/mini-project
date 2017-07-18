require 'rails_helper'

describe "User creates a new restaurant" do
  scenario "a user can create a new restaurant" do
    visit new_restaurant_path

    fill_in "restaurant[name]", with: "Fruition"
    click_button "Create"

    expect(current_path).to eq("/restaurants/#{Restaurant.last.id}")
    expect(page).to have_content("Fruition")
    expect(Restaurant.count).to eq(1)
  end
end
