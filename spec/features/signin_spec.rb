require 'spec_helper'

describe 'sign in', js:true do
  it 'with email' do
    visit '/user/signup'
    fill_in 'User[email]', with: 'victor.sych@gmail.com'
    fill_in 'User[password1]', with: '123123'
    find('input[type="submit"]').click
    expect(page).to have_content 'LOGOUT'
  end
end