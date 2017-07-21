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
    expect(page).to have_content("Welcome, #{user_attributes[:username]}")
    expect(page).to have_content("Create your Sales Rep profile")

    fill_in "sales_rep[name]", with: "Billy Wooooooods"
    fill_in "sales_rep[company]", with: "Sysco"
    fill_in "sales_rep[category]", with: "General"
    fill_in "sales_rep[phone]", with: "720-556-6655"

    click_button "Create Sales rep"

    sales_rep = SalesRep.last

    expect(current_path).to eq("/sales_reps/#{sales_rep.id}")
    expect(page).to have_content(sales_rep.name)
    expect(page).to have_content(sales_rep.company)
    expect(page).to have_content(sales_rep.category)
    expect(page).to have_content(sales_rep.phone)
    expect(page).to have_content(sales_rep.email)
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
    expect(page).to have_content("Welcome, #{user_attributes[:username]}")
    expect(page).to have_content("Create your restaurant's profile")

    fill_in "restaurant[name]", with: "Joe Bob's"
    fill_in "restaurant[description]", with: "fun food"
    fill_in "restaurant[address]", with: "123 street"
    fill_in "restaurant[phone]", with: "720-555-5555"

    click_button "Create Restaurant"

    restaurant = Restaurant.last

    expect(current_path).to eq("/restaurants/#{restaurant.id}")
    expect(page).to have_content(restaurant.name)
    expect(page).to have_content(restaurant.description)
    expect(page).to have_content(restaurant.address)
    expect(page).to have_content(restaurant.phone)
  end
end
