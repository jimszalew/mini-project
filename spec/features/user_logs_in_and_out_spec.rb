require "rails_helper"

RSpec.feature "User logs in and out" do
  scenario "with valid credentials as a Restaurant" do
    user_attributes = {
      username: "jimbotron",
      password: "secretpassword",
      role: "Restaurant"
    }

    user = User.create(user_attributes)
    user.restaurants.create(name: "Foods",
                            description: "we make food",
                            address: "123 street",
                            phone: "720-555-5555" )

    visit login_path

    fill_in "Username", with: user.username
    fill_in "session[password]", with: user_attributes[:password]

    click_on "Login"

    expect(current_path).to eq(restaurant_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Successful Login")

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("#{user.username}")
    expect(page).to have_content("Goodbye")
  end
end
