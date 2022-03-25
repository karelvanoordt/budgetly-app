require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'login' do
    before(:each) do
      visit '/users/sign_up'
    end

    it 'can enter a name and receive a greeting' do
      visit new_user_registration_path
      expect(page).to have_content 'SIGN UP'
    end

    it 'click the login error' do
      click_button
      expect(page).to have_content "Email can't be blank"
    end

    it 'validates if signup fails when leaving a field empty' do
      fill_in 'Full Name', with: ''
      fill_in 'Email', with: 'karel@gmail.com'
      fill_in 'Password', with: '123456'
      fill_in 'Confirm password', with: '123456'
      click_button 'Sign up'

      expect(page).to have_content("Name can't be blank")
    end
  end
end
