require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the new word path', {:type => :feature}) do
  it('displays a word when use enters it in the new word input and enters it') do
    visit('/')
    fill_in('word', :with => 'dongle')
    click_button('Add Word')
    expect(page).to have_content('dongle')
  end
end
