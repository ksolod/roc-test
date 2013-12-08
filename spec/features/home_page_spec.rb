require 'spec_helper'

describe 'home page', js:true do
  it 'check content' do
    visit '/'
    expect(page).to have_content 'Invest with Purpose'
  end
end