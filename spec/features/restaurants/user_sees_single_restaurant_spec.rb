require 'rails_helper'

describe "User views a restaurant page" do
  scenario "a user can view a restaurant's page" do
    restaurant = create(:restaurant)
    visit restaurant_path(restaurant)

    expect(page).to have_content(restaurant.name)
    expect(page).to have_content(restaurant.description)
    expect(page).to have_content(restaurant.address)
    expect(page).to have_content(restaurant.phone)
  end
end
