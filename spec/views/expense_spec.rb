
require 'rails_helper'

RSpec.describe 'Group expenses page', type: :feature do
  before do
    visit '/'
    click_link 'Sign in'
    @user = User.create!(email: 'karel-test@gmail.com', name: 'Karel', password: '123456', id: 1)
    @user.save

    fill_in 'Email', with: 'karel-test@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_on 'Create New Category'
    fill_in 'Category Name', with: 'Test'
    fill_in 'Enter image link', with: 'https://uxwing.com/wp-content/themes/uxwing/download/18-education-school/exam-test.png'
    click_on 'Create Category'
    click_on 'Test'
  end

  it 'validates if new expense button exists' do
    expect(page).to have_content 'Add expense'
  end

  it 'validates if user can create new expense' do
    click_on 'Add expense'
    fill_in 'Name', with: 'Expense test 1'
    fill_in 'Amount', with: 55
    click_on 'Create Expense'
    expect(page).to have_content 'Expense test 1'
  end
end