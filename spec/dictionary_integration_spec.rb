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

describe('the new definition form path', {:type => :feature}) do
  it('displays the definition form page when user clicks the new definition button') do
    visit('/word/1')
    click_link('New Definition')
    expect(page).to have_content('Part of Speech')
  end
end

describe('the new definition path', {:type => :feature}) do
  it('adds a definition to a word if user submits definition form') do
    visit('/word/1/definition')
    fill_in('definition', {:with => 'a small device able to be connected to and used with a computer, especially to allow access to wireless broadband or use of protected software.'})
    find('#part').find(:xpath, 'option[1]').select_option
    click_button('Add Definition')
    expect(page).to have_content('a small device able to be connected to and used with a computer, especially to allow access to wireless broadband or use of protected software.')
    expect(page).to have_content('Noun')
  end
end

describe('the alphabetize path', {:type => :feature}) do
  it('alphabetizes all words that have been entered') do
    visit('/')
    fill_in('word', :with => 'carrot')
    click_button('Add Word')
    fill_in('word', :with => 'banana')
    click_button('Add Word')
    fill_in('word', :with => 'apple')
    click_button('Add Word')
    click_link('Alphabetize')
    expect(page).to have_content('apple banana carrot dongle')
  end
end

describe('the search path', {:type => :feature}) do
  it('searches word list for user input and reveals matches in results page') do
    visit('/')
    fill_in('search', :with => 'carrot')
    click_button('Search')
    expect(page).to have_content('carrot Return to Word List')
  end
end
