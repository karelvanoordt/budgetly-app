require 'rails_helper'

RSpec.describe 'User login page', type: :feature do
  describe 'login' do
    before(:each) do
      @user = User.create!(email: 'karel-test@gmail.com', name: 'Karel', password: '123456', id: 1)
      visit '/users/sign_in'
    end

    it 'validates if user is redirected to login page' do
      visit user_session_path
      expect(page).to have_content 'LOGIN'
    end

    it 'validates correct route' do
      visit user_session_path
      expect(page).to have_current_path(user_session_path)
    end

    it 'validates error message' do
      visit user_session_path
      click_button
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'validates login with incorrect credentials' do
      fill_in 'Email', with: 'usr@email.cm'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end
  end
end