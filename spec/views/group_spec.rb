require 'rails_helper'

RSpec.describe 'Group Page', type: :feature do
  before do
    visit '/'
    click_link 'Sign in'
    @user = User.create!(email: 'karel-test@gmail.com', name: 'Karel', password: '123456', id: 1)
    @user.save

    fill_in 'Email', with: 'karel-test@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end
  it 'validates if user can log in' do
    expect(page).to have_content 'CATEGORIES'
  end

  it 'validates if login redirects to home' do
    expect(page).to have_current_path('/')
  end

  it 'validates if user is redirected to new category page' do
    click_on 'Create New Category'

    expect(page).to have_content 'CREATE CATEGORY'
  end

  it 'validates if user can create new category' do
    click_on 'Create New Category'
    fill_in 'Category Name', with: 'Test'
    fill_in 'Enter image link', with: 'https://uxwing.com/wp-content/themes/uxwing/download/18-education-school/exam-test.png'
    click_on 'Create Category'
    expect(page).to have_content 'Test'
  end
end
