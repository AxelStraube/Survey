require('capybara/rspec')
require('./app')
require('spec_helper')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path to see all surveys', {:type => :feature}) do
  it('will show all surveys') do
    visit('/')
    click_on('Click here to see all surveys')
    expect(page).to have_content("Here are all the surveys you have created")
  end
end
