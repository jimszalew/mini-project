require 'rails_helper'

RSpec.feature "User creates a new account" do
  scenario "and is redirected to profile setup page" do
    user_attributes = { email: "jim.jim@jim.com",
                        username: "jimbotron",
                        password: "pa$$word"}

    visit 'users/new'
    fill_in "user[email]", with: user_attributes[:email]
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]

    click_button "Create Account"

    expect(current_path).to eq("/profiles")
    expect(page).to have_content("Welcome, #{user_attributes[:username]}")
    expect(page).to have_content("What type of account will you be creating?")
    expect(page).to have_link("Vendor")
    expect(page).to have_link("Customer")
  end
end
