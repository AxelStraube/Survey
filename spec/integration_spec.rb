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

describe('the path to create a new survey', {:type => :feature}) do
  it('will show a form to create a new survey') do
    visit('/')
    click_on('Click here to see all surveys')
    click_on('Create a new survey')
    fill_in('name', :with => 'Opinions')
    click_button('Create Survey')
    expect(page).to have_content('Here are all the surveys you have created')
  end
end
