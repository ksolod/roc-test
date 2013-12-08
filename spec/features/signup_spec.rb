require 'spec_helper'

describe 'sign up', js:true do
  it 'with email' do
    visit '/user/signup/with/email'
    fill_in 'UserProfile[first_name]', with: 'Capybara1'
    fill_in 'UserProfile[last_name]', with: 'Capybara2'
    find('input[type="submit"]').click
    wait_for '.errorMessage'
    expect(page).to have_content 'This field cannot be blank.'
  end
end