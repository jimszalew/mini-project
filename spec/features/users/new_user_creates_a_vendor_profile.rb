require 'rails_helper'

RSpec.describe 'As a new user I Vendor account' do
  context 'and I am directed to the new Vendor profile form' do
    it 'I can create my profile' do
      Role.create(name: 'vendor')
      user_attributes = { email: "jim.jim@jim.com",
                          username: "jimbotron",
                          password: "pa$$word"}

      visit 'users/new'
      fill_in "user[email]", with: user_attributes[:email]
      fill_in "user[username]", with: user_attributes[:username]
      fill_in "user[password]", with: user_attributes[:password]

      click_button "Create Account"

      click_on 'Vendor'

      expect(current_path).to eq('/vendor_profiles/new')

      fill_in 'vendor_profile[company]', with: 'Oven Stuff'
      fill_in 'vendor_profile[category]', with: 'Bread'
      fill_in 'vendor_profile[phone]', with: '720-555-5555'
      fill_in 'vendor_profile[name]', with: 'Joe Bagadonuts'
      fill_in 'vendor_profile[title]', with: 'Sales Rep'

      click_button 'Save Profile Info'

      expect(current_path).to eq("/profile/#{user.id}")
    end
  end
end
