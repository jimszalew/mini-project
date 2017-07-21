require 'rails_helper'

RSpec.feature "User creates a new account" do

  scenario "as a sales rep" do
    user_attributes = { username: "jimbotron",
                        password: "pa$$word"}

    visit 'users/new'
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    select "Sales Rep", from: "user[role]"

    click_button "Create Account"

    expect(current_path).to eq("/sales_reps/new")
    expect(page).to have_content("Welcome #{user_attributes[:username]}!")
    expect(page).to have_content("Create your Sales Rep profile")
  end

  scenario "as a restaurant" do
    user_attributes = { username: "jimbotron",
                        password: "pa$$word"}

    visit 'users/new'
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    select "Restaurant", from: "user[role]"

    click_button "Create Account"

    expect(current_path).to eq("/restaurants/new")
    expect(page).to have_content("Welcome #{user_attributes[:username]}!")
    expect(page).to have_content("Create your restaurant's profile")
  end
end
