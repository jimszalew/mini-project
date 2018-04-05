require 'rails_helper'

RSpec.feature "User creates a new account" do
  scenario "and is redirected to account setup page" do
    user_attributes = { email: "jim.jim@jim.com",
                        username: "jimbotron",
                        password: "pa$$word"}

    visit 'users/new'
    fill_in "user[email]", with: user_attributes[:email]
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]

    click_button "Create Account"

    expect(current_path).to eq("/profiles/new")
    expect(page).to have_content("Welcome, #{user_attributes[:username]}")
  end
end
