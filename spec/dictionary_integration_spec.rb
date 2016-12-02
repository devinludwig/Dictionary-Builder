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

describe('the word page path', {:type => :feature}) do
  it('displays the word page when user clicks a word on the home page') do
    visit('/')
    click_link('dongle')
    expect(page).to have_content('Dongle')
    expect(page).to have_content('New Definition')
  end
end

describe('the new definition path', {:type => :feature}) do
  it('displays the definition form page when user clicks the new definition button') do
    visit('/word/1')
    click_link('New Definition')
    expect(page).to have_content('Part of Speech')
  end
end
