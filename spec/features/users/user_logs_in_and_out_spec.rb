require "rails_helper"

RSpec.feature "User logs in and out" do
  scenario "with valid credentials" do
    user_attributes = {
      username: "jimbotron",
      password: "secretpassword",
      email: "skibbidydodop@bebop.bedop"
    }

    user = User.create(user_attributes)
    Role.create(name: 'customer')
    Role.create(name: 'vendor')
    UserRole.create(role: Role.last, user: user)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "session[password]", with: user_attributes[:password]

    click_on "Login"

    expect(current_path).to eq(vendor_profile_path(user))
    expect(page).to have_content("Welcome, #{user.username}")

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("#{user.username}")
    expect(page).to have_content("See you next time!")
  end
end
